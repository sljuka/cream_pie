require 'spec_helper'

describe "projects/show.html.erb" do
	let(:project) { stub_model(Project, name: "my_project") }

	it "displays project details" do
		assign(:project, project)
		render
		rendered.should have_selector('h1', text: project.name)
		rendered.should have_selector('p', text: project.description)
	end

end
