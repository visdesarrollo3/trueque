class VitaminsController < ApplicationController
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
end
