require File.dirname(__FILE__) + '/../spec_helper'

describe Vitamin do
  it "should be valid" do
    Vitamin.new.should be_valid
  end
end
