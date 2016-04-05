class UserController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
  	@user = User.order('id DESC')
  end
  
  def new
    @user = User.new
  end

  def show
    @user = User.order('id DESC')
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Usuario creado exitosamente" 
      redirect_to action: "index"
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(user_params)
      flash[:notice] = "Usuario actualizado exitosamente"
      redirect_to action: "index"
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Usuario eliminado exitosamente"
      redirect_to action: "index"
    end
  end

  def user_params
      #params[:article]
      params.require(:user).permit(:username,:email,:role,:password, :password_confirmation)
  end
end
