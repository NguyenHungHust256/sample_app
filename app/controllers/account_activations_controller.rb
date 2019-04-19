class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]

    if user&.authenticated?(:activation, params[:id]) && !user.activated?
      user.activate
      log_in user
      flash[:success] = t "users.account_activate.edit.active"
      redirect_to user
    else
      flash[:danger] = t "users.account_activate.edit.un_active"
      redirect_to root_url
    end
  end
end
