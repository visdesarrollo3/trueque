#
# The first argument to `can` is the action you are giving the user permission to do.
# If you pass :manage it will apply to every action. Other common actions here are
# :read, :create, :update and :destroy.
#
# The second argument is the resource the user can perform the action on. If you pass
# :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
#
# The third argument is an optional hash of conditions to further filter the objects.
# For example, here the user can only update published articles.
#
#   can :update, Article, :published => true
#
# See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = (user || User.new)
    if @user.admin?
      can :manage, :all
      cannot :trade, @book, :user_id => @user.id
      return
    else
      guest
      member if @user.user?
    end
  end


  def guest
    can :read, :all
    cannot :read, Trade
    cannot :trade, Book
  end

  def member
    can :manage, :all
    can :create, Comment
    
    can :comment, Trade do |trade|
      trade.user1_id == @user.id or trade.user2_id == @user.id
    end
    
    can [:update, :destroy], Comment, {:commentable_id => @user.id, :commentable_type => @user.class.to_s}
    can :manage, Book, :user_id => @user.id
    can :trade, Book
    cannot :trade, @book, :user_id => @user.id
  end


end