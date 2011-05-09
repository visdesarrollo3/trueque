class WaitingController < ApplicationController
  skip_authorization_check
  def index
    @user = User.find params[:user_id]
    @books = @user.waiting_books
  end
end
