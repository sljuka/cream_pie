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

	describe "#h_projects" do

		it "returns projects which have a feature with a name strarting with 'h'" do
			@p1 = Project.create(:name => "new")
			@p2 = Project.create(:name => "new2")

			@f1 = @p1.features.create(:name => "hh")
			@f2 = @p2.features.create(:name => "bh")

			expect(Project.h_projects.count).to eq(1)
		end
	end

end
