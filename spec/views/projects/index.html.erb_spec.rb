require 'spec_helper'

describe "projects/index.html.erb" do

	let(:project1) { stub_model(Project, name: "test") }
	let(:project2) { stub_model(Project, name: "test2") }

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
			rendered.should have_link("Add", href: new_project_path)
		end

		it "displays additional project options" do
			render
			rendered.should have_link("Edit", href: edit_project_path(project1))
			rendered.should have_link("Delete", href: project_path(project1))
			rendered.should have_link("Show", href: project_path(project1))
		end
	end
end
