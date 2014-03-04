require 'spec_helper'

describe "projects/new.html.erb" do

	let(:project) { FactoryGirl.build(:project) }

	before do
		project.name = "newProject"
		project.description = "newProjectDescription"
		assign(:project, project)
	end

	it "displays a cancel link that returns to projects index view" do
		render
		rendered.should have_link("Cancel", href: projects_path)
	end

	it "displays a form for adding projects" do
		render
		rendered.should have_xpath("//form[@action='/projects'][@method='post']")
		rendered.should have_css("input[type='text'][value='newProject'][name='project[name]']")
		rendered.should have_xpath("//textarea[@name='project[description]'][text()='newProjectDescription']")
	end

end