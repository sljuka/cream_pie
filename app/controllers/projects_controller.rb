class ProjectsController < ApplicationController
  
  def index
  	@projects = Project.all
  end

  def show
  	@project = Project.find(params[:id])
    @feature = @project.features.build
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

  class ProjectParams < ActionController::Parameters
    def self.build params
      params.require(:project).permit(:name, :description)
    end
  end

end