class RegistrationsController < Devise::RegistrationsController 

  def new

    flash[:info] = 'Los registros aun no estan habilitados, pero porfavor vuelva pronto.'
    redirect_to new_user_session_path
  end

  def create
    flash[:info] = 'Los registros aun no estan habilitados, pero porfavor vuelva pronto.'   
    redirect_to new_user_session_path
  end	
end
