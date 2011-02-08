require File.dirname(__FILE__) + '/../spec_helper'

describe VitaminsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => Vitamin.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    Vitamin.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Vitamin.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(vitamin_url(assigns[:vitamin]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => Vitamin.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    Vitamin.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Vitamin.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Vitamin.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Vitamin.first
    response.should redirect_to(vitamin_url(assigns[:vitamin]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    vitamin = Vitamin.first
    delete :destroy, :id => vitamin
    response.should redirect_to(vitamins_url)
    Vitamin.exists?(vitamin.id).should be_false
  end
end
