class TodoController < ApplicationController

  def index
    @tasks = Task.list_tasks
  end
  def edit
    @task = Task.find(params[:id])
  end
  def update
    if params[:name] == "" and params[:des] == ""
      flash[:notice] = "Item's name and description are currently empty" 
      redirect_to(:action => 'edit' , :id => params[:id])
    elsif params[:name] == ""
      flash[:notice] = "Item's name is currently empty"
      redirect_to(:action => 'edit' , :id => params[:id])
    elsif params[:des] == ""
      flash[:notice] = "Item's description are currently empty"
      redirect_to(:action => 'edit' , :id => params[:id])
    else
      flash[:notice] = "Edit item is successful"
      task = Task.find(params[:id])
      if task.update_attributes(:name => params[:name], :description => params[:des])
      redirect_to :action => :index
      else
      flash[:notice] = "Item is not exist"
      redirect_to(:action => 'edit' , :id => params[:id])
      end
    end

  end
  # add new item
  def add
  end
  def addItem
    if params[:name] == "" and params[:des] == ""
      flash[:notice] = "Item's name and description are currently empty"
      redirect_to :action => :add 
    elsif params[:name] == ""
      flash[:notice] = "Item's name is currently empty"
      redirect_to :action => :add
    elsif params[:des] == ""
      flash[:notice] = "Item's description are currently empty"
      redirect_to :action => :add
    else
      flash[:notice] = "Add item is successful"
      item = Task.new
      item.name = params[:name]
      item.description = params[:des]
      item.save
      redirect_to :action => :index
    end
    
  end
  # begin function
  def delete
    id = params[:id]
    Task.delete(id)
    redirect_to :action => :index
  end
end
