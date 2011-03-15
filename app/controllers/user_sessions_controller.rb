class UserSessionsController < ApplicationController
  skip_authorization_check
  skip_before_filter :save_location_if_needed
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Has ingresado correctamente"
      redirect_back_or_default root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Has salido de forma segura"
    redirect_to root_url
  end
end
