class ApplicationController < ActionController::Base
	before_action :set_locale
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})
  	{locale: I18n.locale}
  end

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception  
  before_filter :authenticate_user!, :except => [:index, :show]

  protected 

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sing_up) {|u| u.permit(:username, :email, :password, :password_confirmation)}
  	devise_parameter_sanitizer.for(:sing_in) {|u| u.permit(:username, :email, :password, :password_confirmation)}
  end
end
