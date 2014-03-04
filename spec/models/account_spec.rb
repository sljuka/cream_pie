require 'spec_helper'

describe Account do
	
	let(:account) { FactoryGirl.build(:account) }

	describe "account validation" do

		it "is valid with valid attributes" do
			account.should be_valid
		end

		it "is not valid without a username" do
			account.username = nil
			account.should_not be_valid
		end

		it "is valid without a lastname" do
			account.lastname = nil
			account.should be_valid
		end

	end

	describe "after_create callback" do

		before :each do
			account.name = "mrav"
			account.lastname = "atomski"
			account.save
		end

		it "creates account details for the created account" do
			account.account_details.should_not be_nil
		end

		it "creates a street named like 'account[name] i account[lastname]'" do
			account.account_details.first.street.should eq('mrav i atomski')
		end
	end

end
