class FeaturesController < ApplicationController

  def show
    @feature = Feature.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @feature = @project.features.build(FeatureParams.build params)
    respond_to do |format|
      if @feature.save
        format.html { redirect_to @project }
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
    @feature = @project.features.find(params[:id])
    @feature.destroy
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
