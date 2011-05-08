class AdminController < ApplicationController
  skip_authorization_check
  before_filter :require_admin
  
  def index
  end

end
