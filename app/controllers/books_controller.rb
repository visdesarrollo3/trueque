class BooksController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html, :xml, :json, :modal
  
  def index
    @user = User.find params[:user_id] if params[:user_id].present?
    if @user.nil?
      @search = Book.available.search(params[:search])
      # @books = Book.available.newest_first
    else
      @search = @user.books.available.search(params[:search])
      # @books = .available.newest_first.page(params[:page]).per(20)
    end
    @books = @search.page(params[:page]).per(20)
    respond_with @books  
  end
  
  def show
    @book = Book.find(params[:id])
    respond_with @book
  end
  
  def new
    @book = Book.new
    respond_with @book
  end
  
  def create
    @book = current_user.books.new(params[:book])
    if @book.save
      flash[:notice] = "El libro ha sido creado"
      redirect_to @book
    else
      render :action => 'new'
    end
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      flash[:notice] = "El libro se ha actualizado"
      redirect_to @book
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "El libro se ha eliminado"
    redirect_to books_url
  end
end
