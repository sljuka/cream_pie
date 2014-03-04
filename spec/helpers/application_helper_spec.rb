require "spec_helper"

describe ApplicationHelper do
	describe "#current_user" do
    it "when there are no users in database" do
    	Account.should_receive(:create).with(:username => "Djura", :name => "Djura", :lastname => "Djuric")
    	helper.current_user
    end

    it "should return the first user" do
  		helper.current_user.id.should eq(1)
  	end
  end
end