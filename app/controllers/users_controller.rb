class UsersController < ApplicationController
  before_action :require_login, except: [:login, :auth]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def login
  end

  def logout
    session[:user_id] = nil
    redirect_to users_login_path
  end

  def auth
    user = User.find_by(username: params[:username])

    if user and user.password == params[:password]
      session[:user_id] = user.id
      redirect_to dashboard_url
    else
      flash[:notice] = "Wrong credentials"
      redirect_to "/users/login"
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def update
    data = user_params
    if data[:password].empty?
      data.delete :password
    end

    if @user.update(data)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to users_login_path
    end
  end
end
