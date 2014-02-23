class FeaturesController < ApplicationController
  def index
  	@project = Project.find(params[:project_id])
    @features = @project.features
  end

  def show
  
  end

  def create
  
  end

  def new

  end

  class FeatureParams < ActionController::Parameters
    def self.build params
      params.require(:feature).permit(:name, :description)
    end
  end


end
