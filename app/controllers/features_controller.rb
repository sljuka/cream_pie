class FeaturesController < ApplicationController
  def index
  	@projects = Project.all
  end

  def show
  	@feature = Feature.find(params[:id])
  end

  def create
  	@project = Project.find(params[:id])
  	@feature = Feature.new(FeatureParams.build)
  	if @feature.save
  		flash[:notice] = "task added successfuly"
  		redirect_to @feature
  	else
  		flash.now[:error] = "error"
  		render 'new'
  	end
  end

  def new

  end

  class FeatureParams < ActionController::Parameters
    def self.build params
      params.require(:feature).permit(:name, :description)
    end
  end


end
