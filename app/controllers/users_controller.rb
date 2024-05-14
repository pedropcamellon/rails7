class UsersController < ApplicationController
  before_action :require_login, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Thanks for signing up, #{@user.first_name}!"
      redirect_to @user
    else
      flash[:info] = @user.errors.full_messages.first
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])

    if @user.update(user_params)
      flash[:success] = 'Profile Updated'
      redirect_to @user
    else
      flash[:danger] = 'Unable to update profile.'
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :company, :email, :password, :password_confirmation)
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def require_login
      unless logged_in?
        flash[:error] = 'You must be logged in to access this page.'
        redirect_to login_url
      end
    end
end
  