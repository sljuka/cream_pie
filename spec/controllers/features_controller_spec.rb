require 'spec_helper'

describe FeaturesController do

	let(:project) { FactoryGirl.create(:project) }
	let(:feature) { FactoryGirl.create(:feature)}

  describe "#index" do
    
  	it "assigns @project" do
  		project.stub(:features).and_return [feature]
      Project.stub(:find).and_return project
  		get :index, :project_id => project.id
  		assigns[:project].should eq project
  		assigns[:features].should eq project.features
  	end

  	it "renders the index view" do
      get :index, :project_id => project.id
      response.should render_template('index')
  	end

  end

  describe "#show" do

  end

  describe "#new" do

  end

  describe "#create" do

  end

end
