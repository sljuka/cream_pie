require 'spec_helper'

describe FeaturesController do

	let(:project) { FactoryGirl.create(:project) }
	let(:feature) { FactoryGirl.create(:feature)}

  describe "#show" do

  end

  describe "#new" do

  end

  describe "#create" do

  	it "assigns @project" do
  		post :create, :project_id => project, :feature => { :name => "new", :description => "new" }
  		assigns[:project].should eq project
  	end

  	it "builds a new feature to the assigned project" do
  		project = mock_model(Project).as_null_object
  		Project.stub(:find).and_return(project)
  		project.features.should_receive(:build).with('name' => 'new', 'description' => 'new')
  		post :create, :project_id => project, :feature => { :name => "new", :description => "new" }
  	end

  	context "when it is an ajax request" do
  		it "built feature should receive save" do
        pending('Unknown format exception')
  			Project.stub(:find).and_return(project)
  			project.features.stub(:build).and_return(feature)
  			feature.should_receive(:save)
				xhr post :create, :project_id => project, format: :js, :feature => { :name => "new", :description => "new" }
  		end
  	end

  end

end
