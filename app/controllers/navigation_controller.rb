class NavigationController < ApplicationController
  skip_authorization_check
  def site_index
    @latest_books   = Book.newest_first.limit(8)
    @best_books     = User.admins.first.books.newest_first.limit(4)
    @banners        = Banner.all
    @current_survey = Survey.first
  end
end
