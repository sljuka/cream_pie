class TasksController < ApplicationController
  def index
    @feature = Feature.find(params[:feature_id])
    @tasks = @feature.tasks
  end

  def show
    @feature = Feature.find(params[:feature_id])
    @task = @feature.tasks.find(params[:id])
  end

  def new
    @feature = Feature.find(params[:feature_id])
    @task = @feature.tasks.build
  end

  def create
  end

  def finish
  end
end
