class GivenBooksController < ApplicationController
  skip_authorization_check
  def index
    @user = User.find params[:user_id]
    @received_trades = @user.completed_trades.newest_first + @user.accepted_trades.newest_first
  end

end
