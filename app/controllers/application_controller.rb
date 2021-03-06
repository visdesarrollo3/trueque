# encoding: UTF-8
class ApplicationController < ActionController::Base
  check_authorization
  protect_from_forgery
  before_filter :save_location_if_needed, :get_sidebar_content
  helper_method :current_user, :admin?

  # application_controller.rb

  rescue_from CanCan::AccessDenied do |exception|
    user = current_user
    logger.info { "\n\n************************************** Access Denied" }
    logger.info { "[Beggining of Cancan Log]" }
    logger.info { "\t[Cancan] Denied when accessing: #{exception.subject}##{exception.action}" }
    logger.info { "\t[Cancan] Guest: #{user.nil?}" }
    unless user.nil?
      logger.info { "\t[Cancan] User login: #{user.login}" }
      logger.info { "\t[Cancan] User Role: #{user.role}" }
    end
    logger.info { "[End of Cancan Log]" }
    logger.info { "**************************************\n\n" }
    redirect_to root_url, :alert => "No tienes permiso para acceder esta página"
  end


  private
  
  def admin?
    current_user && current_user.admin?
  end
  
  def require_admin
    unless current_user && current_user.admin?
      raise CanCan::AccessDenied and return
    end
  end

  def get_sidebar_content
    @other_users = User.scoped.shuffle.first(5)
  end

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
