class TodoController < ApplicationController

  def index
    @tasks = Task.list_tasks
  end
  def edit
  end
  # add new item
  def add
  end
  def addItem
    item = Task.new
    item.name = params[:name]
    item.description = params[:des]
    item.save
    redirect_to(:action => '')
  end
  def delete
    id = params[:id]
    Task.delete(id)
    redirect_to(:action => '')
  end
end
