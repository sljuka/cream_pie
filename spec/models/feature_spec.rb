require 'spec_helper'

describe Feature do

	let(:feature) { FactoryGirl.build(:feature) }
	let(:feature2) { FactoryGirl.build(:feature) }

	it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:project) }
  it { should respond_to(:token) }

	describe "feature validation" do

		it "is valid with valid attributes" do
			feature.should be_valid
		end

		it "is not valid without a name" do
			feature.name = nil
			feature.should_not be_valid
		end

		it "is valid without a description" do
			feature.description = nil
			feature.should be_valid
		end

	end

	it "can't save 2 features with the same token (token is unique)" do
		feature.save
		feature2.save
		expect { feature2.update_column(:token, feature.token) }.to raise_error(ActiveRecord::RecordNotUnique) 
	end

	describe "before_validation callback" do
		it "creates a token for the feature" do
			feature.token = nil
			feature.valid?
			feature.token.should_not be_nil
		end
	end
	
end
