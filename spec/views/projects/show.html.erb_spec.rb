require 'spec_helper'

describe "projects/show.html.erb" do
	let(:project) { stub_model(Project, name: "my_project") }
	let(:feature) { stub_model(Feature, name: "new_feature")}

	it "displays project details" do
		assign(:project, project)
		assign(:feature, feature)
		render
		rendered.should have_selector('h1', text: project.name)
		rendered.should have_selector('p', text: project.description)
	end

end
