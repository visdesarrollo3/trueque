class NavigationController < ApplicationController
  skip_authorization_check
  def site_index
    @latest_books   = Book.newest_first.available.limit(8)
    @best_books     = User.esquina_trueque.first.books.available.newest_first.limit(4) if User.esquina_trueque.first
    @best_books   ||= Book.newest_first.available.limit(8)
    @banners        = Banner.all
    @current_survey = Survey.first
  end
end
