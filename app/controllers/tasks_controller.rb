class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    find_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.task_creator = current_user
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def edit
    find_task
  end

  def update
    find_task

    if @task.update
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end


  private

    def task_params
      params.require(:task).permit(:title, :description, :task_status, :category_id, :deadline)
    end

    def find_task
      @task = Task.find(params[:id])
    end

end
