require 'spec_helper'

describe "projects/show.html.erb" do
	let(:project) { stub_model(Project, name: "my_project") }
	let(:feature) { stub_model(Feature, name: "new_feature")}

	let(:feature1) { FactoryGirl.create(:feature, :name => 'onea')}
	let(:feature2) { FactoryGirl.create(:feature, :name => 'spatula')}
	let(:feature3) { FactoryGirl.create(:feature, :name => 'feature')}

	before :each do
		assign(:project, project)
	end

	it "displays project details" do
		render
		rendered.should have_selector('h1', text: project.name)
		rendered.should have_selector('p', text: project.description)
	end

	it "displays '2' next to every feature that contains 2 'a' in it's name" do		
		project.stub(:features).and_return([feature1, feature2, feature3])
		render
		rendered.should have_selector('strong', text: '2')
	end

	it "does not display '2' if there are no features with 2 'a' in name" do
		feature2.name = 'feature'
		project.stub(:features).and_return([feature1, feature2, feature3])
		render
		rendered.should_not have_selector('strong', text: "2")
	end

end
