class AuthorsController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :xml, :json
  
  def list
    @authors = Author.all
    respond_with @authors
  end
end
