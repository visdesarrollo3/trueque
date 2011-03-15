class PagesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :xml, :json, :modal
  
  def index
    @pages = Page.all
    respond_with @pages
  end
  
  def show
    @page = Page.find params[:id]
    respond_with @page
  end
  
  def new
    @page = Page.new
    respond_with @page
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      respond_with @page, :location => static_path(@page.permalink)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @page = Page.find params[:id]
    respond_with @page
  end
  
  def update
    @page = Page.find params[:id]
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      respond_with @page, :location => static_path(@page.permalink)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page.destroy
    flash[:notice] = "Successfully destroyed page."
    respond_with @page, :location => pages_url
  end
  
  private
  
  def find_page_by_permalink
    @page = Page.find_by_permalink(params[:id])
    raise ActiveRecord::RecordNotFound, "Static page not found" if @page.nil?
  end
end
