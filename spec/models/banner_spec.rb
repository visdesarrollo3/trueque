require File.dirname(__FILE__) + '/../spec_helper'

describe Banner do
  it "should be valid" do
    Banner.new.should be_valid
  end
end
