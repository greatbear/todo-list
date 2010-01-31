class TodoController < ApplicationController

  def index
    @tasks = Task.list_tasks
  end
  def list
  end
end
