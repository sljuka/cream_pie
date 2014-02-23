require 'spec_helper'

describe "projects/new.html.erb" do

	let(:project) do
		mock_model("Project").as_new_record.as_null_object
	end

	before do
		assign(:project, project)
	end

	it "displays a link for projects index view" do
		render
		rendered.should have_link("projects", href: projects_path)
	end

	it "displays a form for adding projects" do
		project.stub(:name => "newProject")
		project.stub(:description => "newProjectDescription")
		render
		rendered.should have_xpath("//form[@action='/projects'][@method='post']")
		rendered.should have_css("input[type='text'][value='newProject'][name='project[name]']")
		rendered.should have_xpath("//textarea[@name='project[description]'][text()='newProjectDescription']")
	end

end