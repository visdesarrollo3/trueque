class TagsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :xml, :json
  
  def list
    @tags = ActsAsTaggableOn::Tag.all
    respond_with @tags
  end

end
