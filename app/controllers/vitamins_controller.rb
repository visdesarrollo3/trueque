class VitaminsController < ApplicationController
  load_and_authorize_resource
  
  before_filter :find_featured_vitamin, :only => [:index]
  
  def index
    @vitamins = Vitamin.all
  end
  
  def show
    @vitamin = Vitamin.find(params[:id])
  end
  
  def new
    @vitamin = Vitamin.new
  end
  
  def create
    @vitamin = Vitamin.new(params[:vitamin])
    
    @featured_vitamin.demote! if @featured_vitamin && @vitamin.featured?

    if @vitamin.save
      flash[:notice] = "Successfully created vitamin."
      redirect_to @vitamin
    else
      render :action => 'new'
    end
  end
  
  def edit
    @vitamin = Vitamin.find(params[:id])
  end
  
  def update
    @vitamin = Vitamin.find(params[:id])
    if @vitamin.update_attributes(params[:vitamin])
      @featured_vitamin.demote! if @featured_vitamin && @vitamin.featured? && @vitamin != @featured_vitamin
      flash[:notice] = "Successfully updated vitamin."
      redirect_to @vitamin
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @vitamin = Vitamin.find(params[:id])
    @vitamin.destroy
    flash[:notice] = "Successfully destroyed vitamin."
    redirect_to vitamins_url
  end
  
  private
  
  def find_featured_vitamin
    @featured_vitamin = Vitamin.featured.first
  end
    
end
