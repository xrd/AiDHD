require 'spec_helper'

describe Inquiry do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Inquiry.create!(@valid_attributes)
  end
end
