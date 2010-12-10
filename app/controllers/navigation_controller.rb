class NavigationController < ApplicationController
  def index
    @latest_books = Book.newest_first.limit(4)
    #@best_books   = Book.best.limit(4)
  end
end
