require File.dirname(__FILE__) + '/../spec_helper'

describe Trade do
  it "should be valid" do
    Trade.new.should be_valid
  end
end
