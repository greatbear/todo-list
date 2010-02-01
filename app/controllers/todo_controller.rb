class TodoController < ApplicationController

  def index
    @tasks = Task.list_tasks
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    task = Task.find(params[:id])
    if task.update_attributes(:name => params[:name], :description => params[:des])
    redirect_to :action => :index
    else
    render :action => :edit
    end
  end
  # add new item
  def add
  end
  def addItem
    item = Task.new
    item.name = params[:name]
    item.description = params[:des]
    item.save
    redirect_to :action => :index
  end
  def delete
    id = params[:id]
    Task.delete(id)
    redirect_to :action => :index
  end
end
