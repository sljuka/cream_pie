require 'spec_helper'

describe ProjectsController do

	let(:project) { FactoryGirl.create(:project) }

	describe "#index" do
		
		it "assigns @projects" do
			get :index
			assigns[:projects].should eq([project])
		end

		it "renders the :index view" do
			get :index
			response.should render_template('index') 
		end

	end

	describe "#show" do

		it "assigns @project" do
			get :show, :id => project.id
			assigns[:project].should eq project
		end

		it "renders the project show page" do
			get :show, :id => project.id
			response.should render_template('show')
		end

	end

	describe "#new" do
		
		let(:project) { mock_model(Project).as_null_object }

		before do
			Project.stub(:new).and_return(project)
		end

		it "assigns @project" do
			get :new
			assigns[:project].should eq project
		end

		it "renders the new project page" do
			get :new
			response.should render_template('new')
		end

	end

	describe "#create" do

		let(:project) { mock_model(Project).as_null_object }
		let(:project_params) { double(:project_params) }
		
		before do
			Project.stub(:new).and_return(project)
			ProjectsController::ProjectParams.stub(:build) { project_params }
		end

		it "creates a new project" do
			Project.should_receive(:new).with(project_params).and_return(project)
			post :create, :project => { name: "test" }
		end

		it "atempts to save the new project" do
			project.should_receive(:save)
			post :create
		end

		context "when save is successful" do
			
			before do
				project.stub(:save).and_return(true)
			end

			it "notifies the client for good news" do
				post :create
				flash[:success].should eq("project added successfuly!")
			end

			it "redirects to the created project show view" do
				post :create
				response.should redirect_to project
			end

		end

		context "when save is not successful" do

			before do
				project.stub(:save).and_return(false)
			end

			it "assigns @project" do
				post :create
				assigns[:project].should eq(project)
			end

			it "it notifies the client for bad news" do
				post :create
				flash[:error].should eq("error while adding project")
			end

			it "renders new project view" do
				post :create
				response.should render_template("new")
			end

		end

	end

end
