require 'spec_helper'

describe Project do

	let(:project) { FactoryGirl.build(:empty_project) }
	
	describe "project validation" do

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

	end

	describe "#h_projects" do

		context "with a project with no features" do

			before :each do
				project.save
			end

			it "returns 0 h projects" do
				expect(Project.h_projects.count).to eq(0)
			end

		end

		context "with projects that have features who's name starts with a 'h'" do
			let(:feature) { FactoryGirl.build(:feature, name: "havana") }
			let(:feature2) { FactoryGirl.build(:feature, name: "no_h") }
			let(:feature3) { FactoryGirl.build(:feature, name: "Having") }

			before :each do
				feature.save
				feature2.save
				feature3.save
			end

			it "returns 2 projects" do
				expect(Project.h_projects.count).to eq(2)
			end

			it "returns those projects" do
				expect(Project.h_projects).to eq [feature.project, feature3.project]
			end
		end
	end
end
