require 'spec_helper'

describe Entry do
  it "should have a valid factory" do
  	FactoryGirl.build(:entry).should be_valid
  end
end
