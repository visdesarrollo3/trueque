require 'spec_helper'

describe TagsController do

  describe "GET 'list'" do
    it "should be successful" do
      get 'list'
      response.should be_success
    end
  end

end
