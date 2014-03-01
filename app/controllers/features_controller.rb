class FeaturesController < ApplicationController

  def show
    @feature = Feature.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    respond_to do |format|
      @feature = @project.features.build(FeatureParams.build params)
      if @feature.save
        format.html
        format.js
      else
        flash.now[:error] = "error while adding feature"
        render :template => 'projects/show'
      end
    end
  end

  def destroy
    project = Project.find(params[:project_id])
    @feature = project.features.find(params[:id])
    @feature.destroy
    @project = Project.find(params[:project_id])
    respond_to do |format|
      format.html
      format.js
    end
  end

  class FeatureParams < ActionController::Parameters
    def self.build params
      params.require(:feature).permit(:name, :description)
    end
  end


end
