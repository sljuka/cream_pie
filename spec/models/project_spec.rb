require 'spec_helper'

describe Project do

	let(:project) { FactoryGirl.create(:project) }
	let(:project2) { FactoryGirl.create(:project) }

	it "is valid with valid attributes" do
		project.should be_valid
	end

	it "is not valid without a name" do
		project.name = nil
		project.should_not be_valid
	end

	it "is valid without a description" do
		project.description = nil
		project.should be_valid
	end

	it "has no projects in database" do
		expect(Project).to have(0).records
	end

end
