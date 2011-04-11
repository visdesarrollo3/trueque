class SurveyVotesController < ApplicationController
  load_and_authorize_resource
  respond_to :js
  def create
    @vote = current_user.votes.new(params[:survey_vote])
    if @vote.save
      respond_with(@vote, :location => root_url, :status => :ok, :layout => !request.xhr?)
    else
      respond_with(@vote.errors, :status => :unprocessable_entity, :layout => !request.xhr?)
    end
  end
end
