require File.dirname(__FILE__) + '/../spec_helper'

describe Grade do
  it "should be valid" do
    Grade.new.should be_valid
  end
end
