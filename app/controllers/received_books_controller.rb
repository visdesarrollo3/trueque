class ReceivedBooksController < ApplicationController
  def index
    @trades = current_user.completed_trades
  end

end
