class BooksController < ApplicationController
  def index
    @user = User.find params[:user_id] if params[:user_id]
    @books = if @user.nil?
                Book.all
              else
                @user.books.all
              end
    
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(params[:book])
    if @book.save
      flash[:notice] = "Successfully created book."
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
      flash[:notice] = "Successfully updated book."
      redirect_to @book
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Successfully destroyed book."
    redirect_to books_url
  end
end
