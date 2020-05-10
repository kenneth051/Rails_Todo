class TodosController < ApplicationController
  include Secured
  skip_before_action :logged_in, only: [:login]

  def login
  end

  def index
    @todos = Todo.all
    if session[:userinfo]["admin"]
      @todo_count = @todos.joins(:user).group(:user_id, :name).count(:user_id)
      @users = User.includes(:todos).all
      return
    end
    id = session[:userinfo]["id"]
    @todos=@todos.where(:user_id => id)
  end

  def show
    @todo = Todo.find_by(id: params[:id], user_id: session[:userinfo]["id"])
  end

  def new
    @todo = Todo.new
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def create
    todo_params["user_id"] = session[:userinfo]["id"]
    @todo = Todo.new({ title: todo_params["title"], body: todo_params["body"], user_id: session[:userinfo]["id"] })

    if @todo.save
      redirect_to @todo
    else
      render "new"
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      redirect_to @todo
    else
      render "edit"
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :body)
  end
end
