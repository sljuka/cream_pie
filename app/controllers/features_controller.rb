class FeaturesController < ApplicationController

  def show
    @feature = Feature.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @feature = @project.features.build(FeatureParams.build params)
    if @feature.save
      flash[:success] = "project added successfuly!"
      redirect_to @project
    else
      flash.now[:error] = "error while adding feature"
      render :template => 'projects/show'
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @feature = Feature.find(params[:id])
    @feature.destroy
    redirect_to @project
  end

  class FeatureParams < ActionController::Parameters
    def self.build params
      params.require(:feature).permit(:name, :description)
    end
  end


end
