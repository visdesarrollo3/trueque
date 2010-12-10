class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end
  
  def show
    @trade = Trade.find(params[:id])
  end
  
  def new
    @trade = Trade.new
  end
  
  def create
    @trade = Trade.new(params[:trade])
    if @trade.save
      flash[:notice] = "Successfully created trade."
      redirect_to @trade
    else
      render :action => 'new'
    end
  end
  
  def edit
    @trade = Trade.find(params[:id])
  end
  
  def update
    @trade = Trade.find(params[:id])
    if @trade.update_attributes(params[:trade])
      flash[:notice] = "Successfully updated trade."
      redirect_to @trade
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @trade = Trade.find(params[:id])
    @trade.destroy
    flash[:notice] = "Successfully destroyed trade."
    redirect_to trades_url
  end
end
