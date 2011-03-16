# coding: utf-8
class TradesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @trades = current_user.pending_trades
    
  end
  
  def show
    @trade = Trade.find(params[:id])
  end
  
  def new
    book2 = Book.find(params[:book_id])
    @trade = Trade.new
    @trade.initiator = current_user
    @trade.receiver = book2.user
  end
  
  def create
    book2 = Book.find(params[:book_id])
    @trade = Trade.new
    @trade.book2_id = book2.id
    @trade.initiator = current_user
    @trade.receiver = book2.user
    if @trade.save
      flash[:notice] = "Se ha enviado la petición de trueque"
      redirect_to book2
    else
      flash[:error] = "Lo sentimos, algo extraño sucedió! Intenta nuevamente"
      render book2
    end
  end
  
  def accept
    @trade = Trade.find params[:id]
    @trade.book1_id = params[:book_id]
    if @trade.accept and @trade.save
      flash[:notice] = "El trueque ha sido exitoso! Disfruta tu nuevo libro!"
    else
      flash[:error] = "El sistema no pudo intercambiar los libros, intenta nuevamente."
    end
    redirect_to trades_path
  end
  
  def pre_accept
    @trade  = Trade.find params[:id]
    @user   = @trade.user1
    @books  = @user.books.available
  end
  
  def ignore
    @trade = Trade.find params[:id]
    if @trade.ignore
      flash[:notice] = "El trueque ha sido ignorado!"
    else
      flash[:error] = "El sistema no pudo ignorar el trueque, intenta nuevamente"
    end
    redirect_to trades_path
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
