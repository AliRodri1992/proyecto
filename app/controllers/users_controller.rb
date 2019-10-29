class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.order(:username)
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
      flash[:success] = "User created successfully."
    else
      flash[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
      flash[:success] = "User updated successfully."
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted successfully."
    redirect_to users_path
  end

  private
  def user_params
    params[:user][:rol_id] = params[:user][:rol_id].to_i
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :rol_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
