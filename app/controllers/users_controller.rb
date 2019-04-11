class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = t(".new.success_ac")
      redirect_to @user
    else
      flash[:danger] = t(".new.fail_ac")
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    redirect_to root_path
    flash[:danger] = t(".error")
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end