
require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe InquiriesController do

  before(:each) do
    User.create :username => 'foobar'
    # @current_user = User.first
    login_as( User.first )
  end

  describe "#create" do
    it "should create from our javascript created hashes" do
      params = {"inquiry" => 
        {"questions"=> { "title"=>"", 
            "1270103251854"=> {"title"=>"I can live without this one.", "type"=>""}, 
            "type"=>"", 
            "1270103231813"=> {"title"=>"I'm not sure if I liek this.", "type"=>"open"}, 
            "1270103244644"=> {"title"=>"Another one, is here", "type"=>""}, 
            "1270103257009"=> {"title"=>"Yeah, but will they use it?", "type"=>""} },
          "title"=>"Yo, this is cool!"}, 
        "commit"=>"Save Questions" } 
      lambda {
        lambda {
          post :create, params
        }.should change(Inquiry,:count).by(1)
      }.should change(Question,:count).by(3)

    end
  end
end
