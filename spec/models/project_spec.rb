require 'spec_helper'

describe Project do

	let(:project) { FactoryGirl.build(:empty_project) }
	
	it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:features) }
  it { should respond_to(:project_members) }
  it { should respond_to(:accounts)}

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

	describe "::h_projects" do
		let(:feature) { FactoryGirl.build(:feature, name: "havana") }
		let(:feature2) { FactoryGirl.build(:feature, name: "no_h") }
		let(:feature3) { FactoryGirl.build(:feature, name: "Having") }

		context "with a project with no features" do
			it "returns 0 h projects" do
				project.save
				expect(Project.h_projects.count).to eq(0)
			end

		end

		context "with projects that have features who's name starts with a 'h'" do		
			it "returns those projects" do
				feature.save
				feature2.save
				feature3.save

				expect(Project.h_projects).to eq [feature.project, feature3.project]
			end

		end

		context "with projects that have no features who's name starts with a 'h'" do
			it "returns no h projects" do
				feature.name = "no_h_first"
				feature3.name = "something"
				
				feature2.save
				feature.save
				feature3.save

				expect(Project.h_projects).to eq []
			end			

		end

	end

	describe "::available_accounts" do
		let(:account1) { FactoryGirl.build(:account) }
		let(:account2) { FactoryGirl.build(:account) }

		before :each do
			account1.save
			account2.save
			project.save
		end

		context "having accounts and project without project members" do
			it "returns available accounts" do
				Project.available_accounts(project).should eq [account1, account2]
			end

		end

		context "having accounts that are all members of project" do
			it "returns no accounts" do
				ProjectMember.create(:project_id => project.id, :account_id => account1.id)
				ProjectMember.create(:project_id => project.id, :account_id => account2.id)

				Project.available_accounts(project).should eq []
			end

		end

		context "having some accounts that are not project members" do
			it "returns available accounts" do
				ProjectMember.create(:project_id => project.id, :account_id => account1.id)

				Project.available_accounts(project).should eq [account2]
			end

		end

	end

end
