require 'spec_helper'

describe "projects/index.html.erb" do

	let(:project1) { FactoryGirl.build_stubbed(:project, name: "test", description: "test") }
	let(:project2) { FactoryGirl.build_stubbed(:project, name: "test2", description: "test") }

	let(:account1) { FactoryGirl.build_stubbed(:account, username: "pera") }
	let(:account2) { FactoryGirl.build_stubbed(:account, username: "djura") }

	describe "projects section" do

		context "with 2 projects" do
			before(:each) do
				assign(:projects, [project1, project2])
			end

		  it "displays all projects" do
			  render
			  rendered.should have_content("test")
			  rendered.should have_content("test2")
			end

			it "displays an add project link" do
				render
				rendered.should have_link('Add project', href: new_project_path)
			end

			it "displays additional project options for each project" do
				render
				displays_project_options(project1)
				displays_project_options(project2)
			end
		end

	end

	describe "accounts section" do

		before :each do
			assign(:projects, [project1, project2])
			assign(:accounts, [account1, account2])
		end

		it "displays add account link" do
			render
			rendered.should have_link('Add account', href: new_account_path)
		end

		it "displays accounts" do
			render
			rendered.should have_content("pera")
			rendered.should have_content("djura")
		end

	end

end

def displays_project_options(project)
	rendered.should have_link("Delete", href: project_path(project))
	rendered.should have_link("Show", href: project_path(project))
end