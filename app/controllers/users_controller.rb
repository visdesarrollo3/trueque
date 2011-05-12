class UsersController < ApplicationController
  load_and_authorize_resource
  
  def index
    @users = User.page(params[:page]).per(20)
  end
  
  def show
    @user = User.includes(:waiting_books).find(params[:id])
    @waiting_books = @user.waiting_books.limit(4)
    @books = @user.books.newest_first.available.limit(4)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "El usuario ha sido creado"
      redirect_to @user
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = "Tu perfil ha sido actualizado"
      redirect_to @user
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "Tu cuenta ha sido eliminada exitosamente."
    redirect_to users_url
  end
end
