require 'spec_helper'

describe "projects/index.html.erb" do

	let(:project1) { stub_model(Project, name: "test", description: "test") }
	let(:project2) { stub_model(Project, name: "test2", description: "test") }

	context "with 2 projects" do
		before(:each) do
			assign(:projects, [
		  	project1,
		  	project2
	  	])
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
			displays_options(project1)
			displays_options(project2)
		end
	end

end

def displays_options(project)
	rendered.should have_link("Delete", href: project_path(project))
	rendered.should have_link("Show", href: project_path(project))
end