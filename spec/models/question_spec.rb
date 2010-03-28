require 'spec_helper'

describe Question do
  before(:each) do
    @valid_attributes = {
      :type => "value for type",
      :title => "value for title",
      :caption => "value for caption"
    }
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@valid_attributes)
  end
end
