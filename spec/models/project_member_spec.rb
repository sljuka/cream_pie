require 'spec_helper'

describe ProjectMember do
	
	let(:pera_member) { FactoryGirl.build(:pera_project_member) }
	let(:account) { FactoryGirl.build(:account) }

	it { should respond_to(:project) }
  it { should respond_to(:project_id) }
  it { should respond_to(:account) }
  it { should respond_to(:account_id) }

  describe "::add_member_to_project" do
		
  	before :each do
  		pera_member.save
  	end

  	context "when an account is already a member and tries to become a member again" do
  		it "dennies the action (returns false)" do
  			account = pera_member.account
  			project = pera_member.project

  			ProjectMember.add_member_to_project(:account_id => account.id, :project_id => project.id).should eq false
  		end
  	end

  	context "when an account that is not a member of project tries to become a project member" do
  		it "creates the new project member" do
  			account.save
  			project = pera_member.project
  			parameter_hash = { :account_id => account.id,:project_id => project.id }
  			expect{ ProjectMember.add_member_to_project(parameter_hash)}.to change{ProjectMember.count }.by(1)
  		end
  	end

  end

  describe "#remove_from_project" do

		before :each do
			account.save
			pera_member.save
		end
		
		context "when account is not member of project and tries to remove a member" do

			it "denies the action" do
				expect{ pera_member.remove_from_project(account) }.to_not change{ProjectMember.count}
			end

			it "returns false" do
				pera_member.remove_from_project(account).should eq false
			end

		end

		context "when account is member of project and tries to remove a member" do
			
			it "removes the member" do
				member = ProjectMember.create(:account_id => account.id, :project_id => pera_member.project.id)
				expect{ pera_member.remove_from_project(account) }.to change{ProjectMember.count}.by(-1)
			end

		end

		context "when a member tries to remove himself from project" do
			it "removes the member" do
				expect{ pera_member.remove_from_project(pera_member.account) }.to change{ProjectMember.count}.by(-1)
			end
		end
  end

end
