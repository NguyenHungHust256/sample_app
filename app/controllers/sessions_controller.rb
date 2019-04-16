class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase

    if user&.authenticate(params[:session][:password])
      flash.now[:success] = t ".success"
      login_with_remember user
    else
      flash.now[:danger] = t ".error"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def login_with_remember user
    log_in user
    remember_me = params[:session][:remember_me]
    remember_me == Settings.checkbox ? remember(user) : forget(user)
    redirect_to user
  end
end
