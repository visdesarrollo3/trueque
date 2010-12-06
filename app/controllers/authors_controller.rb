class AuthorsController < ApplicationController
  respond_to :html, :xml, :json
  
  def list
    @authors = Author.all
    respond_with @authors
  end
end
