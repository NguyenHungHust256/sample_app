class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :set_locale

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t ".logged_in_user.unsuccess"
    redirect_to login_url
  end

  private

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    if I18n.available_locales.include? locale
      I18n.locale = locale
    elsif I18n.locale = I18n.default_locale
    end
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
