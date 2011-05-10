require File.dirname(__FILE__) + '/../spec_helper'

describe ForumThread do
  it "should be valid" do
    ForumThread.new.should be_valid
  end
end
