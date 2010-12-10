class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :get_banners
  
  helper_method :current_user

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def get_banners
    @banners = Banner.all
  end
  
end
