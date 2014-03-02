class ProjectsController < ApplicationController
  
  def index
  	@projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
    @accounts = Project.available_accounts(@project)
  end

  def new
    @project = Project.new
  end

  def create
  	@project = Project.new(ProjectParams.build(params))
  	if @project.save
  		flash[:success] = "project added successfuly!"
  		redirect_to @project
  	else
      flash.now[:error] = "error while adding project"
  		render 'new'
  	end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def h_projects
    @projects = Project.h_projects
  end

  class ProjectParams < ActionController::Parameters
    def self.build params
      params.require(:project).permit(:name, :description)
    end
  end

end