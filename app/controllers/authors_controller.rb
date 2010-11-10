class AuthorsController < ApplicationController
  def search
    # regex = params[:term].split(/[,]\s*/)
    @authors = Author.search_for(params[:term].to_s).map(&:name)
    render :text => @authors
  end
end
