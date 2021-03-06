class TagsController < ApplicationController
  skip_authorization_check
  respond_to :html, :xml, :json
  
  def list
    @tags = ActsAsTaggableOn::Tag.all
    respond_with @tags
  end

end
