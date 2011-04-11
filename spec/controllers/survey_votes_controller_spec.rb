require File.dirname(__FILE__) + '/../spec_helper'

describe SurveyVotesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => SurveyVote.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    SurveyVote.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    SurveyVote.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(survey_vote_url(assigns[:survey_vote]))
  end

  it "edit action should render edit template" do
    get :edit, :id => SurveyVote.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    SurveyVote.any_instance.stubs(:valid?).returns(false)
    put :update, :id => SurveyVote.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    SurveyVote.any_instance.stubs(:valid?).returns(true)
    put :update, :id => SurveyVote.first
    response.should redirect_to(survey_vote_url(assigns[:survey_vote]))
  end

  it "destroy action should destroy model and redirect to index action" do
    survey_vote = SurveyVote.first
    delete :destroy, :id => survey_vote
    response.should redirect_to(survey_votes_url)
    SurveyVote.exists?(survey_vote.id).should be_false
  end
end
