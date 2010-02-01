class TodoController < ApplicationController

  def index
    @tasks = Task.list_tasks
  end
  def list
  end
  # add new item
  def add
  end

end
