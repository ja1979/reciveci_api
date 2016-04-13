class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :username,presence:{message:"Debe ingresar un monbre de usuario"},length:{
  minimum:4,
  too_short:"Debe ingresar %{count} caracteres para el nombre de usuario"

  }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: { :with => VALID_EMAIL_REGEX , message: "El formato del correo es invalido" },uniqueness: {case_sensitive: false ,message: "ya esta registrado"},presence:{message:"Debe ingresar un correo"}

validates :password,presence:{message:"Debe ingresar una contraseña"},length:{
  minimum:8,
  too_short:"Debe ingresar %{count} caracteres como minimo para la  contraseña"

  }



  validates :password_confirmation,presence:{message:"Debe confirmar contraseña"},length:{
  minimum:8,
  too_short:"Debe ingresar %{count} caracteres como minimo para la  confirmacion de contraseña"

  }

validates_confirmation_of :password,:message=>"Las contraseñas no coinciden"



validates :role,presence:{message:"Debe asignar un rol al nuevo usuario"}




  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

 #Posibles roles a asignar
  Roles = %w[administrador autor].freeze         
end
