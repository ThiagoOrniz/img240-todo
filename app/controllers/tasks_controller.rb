class TasksController < ApplicationController
  before_action :lookup_task, except: [:index, :create]

  def index
    @tasks = Task.recent
  end

  def show
  end

  def new
  end

  def create
    @task = Task.new(task_params)
    respond_to do |format|
      if @task.save
        format.js { }
        format.html { redirect_to root_url, notice: 'Created task' }
      else
        format.js { }
        format.html { render 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js { }
        format.html { redirect_to root_url, notice: 'Updated task' }
      else
        format.js { }
        format.html { render 'edit' }
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :completed)
  end

  def lookup_task
    @task = Task.find(params[:id])
  end
end
