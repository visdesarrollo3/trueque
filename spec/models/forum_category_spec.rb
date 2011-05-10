require File.dirname(__FILE__) + '/../spec_helper'

describe ForumCategory do
  it "should be valid" do
    ForumCategory.new.should be_valid
  end
end
