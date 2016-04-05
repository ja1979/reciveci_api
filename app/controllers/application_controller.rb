class ApplicationController < ActionController::Base
	before_action :set_locale
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, if: :devise_controller?

  #para solucionar el error de parametros que tiene cancan con rails 4+
  before_filter do
  resource = controller_name.singularize.to_sym
  method = "#{resource}_params"
  params[resource] &&= send(method) if respond_to?(method, true)
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def set_locale
  	I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def default_url_options(options={})
  	{locale: I18n.locale}
  end

  #solicitar autenticacion en todos los metodos a menos que sea en foramto json
  before_action :authenticate_user!, :only => [:index, :show, :new, :edit, :create, :update, :destroy], :unless => [:is_json]

  private
  def is_json
    request.format.json?
  end


  protected 

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :role, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:username, :email, :password)}
  end

  def note_params
    params.require(:note).permit(:what, :ever)
  end

  #enviar mensaje para de acceso denegado
  rescue_from CanCan::AccessDenied do |exception|
     redirect_to 'http://localhost:3000/users/sign_in' ,:flash => { :error => "NO tienes Permisos para realizar esta acción." }
  end

end
