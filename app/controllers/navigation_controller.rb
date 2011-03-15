class NavigationController < ApplicationController
  skip_authorization_check
  def site_index
    @latest_books = Book.newest_first.limit(8)
    @best_books   = Book.limit(4)
  end
end
