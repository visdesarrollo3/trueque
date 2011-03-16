class ApplicationController < ActionController::Base
  check_authorization
  protect_from_forgery
  before_filter :save_location_if_needed
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
  
  def save_location_if_needed
    return unless request.format.html?
    if current_user
      session[:return_to] = nil
    else
      session[:return_to] = request.request_uri
    end
    
  end
  
  def redirect_back_or_default(default=root_url)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def redirect_to_referer_or_default (goto_url=root_url)
    redirect_to (session[:referer] || goto_url)
  end
  
end
