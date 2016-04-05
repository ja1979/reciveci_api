class DashboardController < ApplicationController
	before_filter :authenticate_user!
  

  # GET /user
  def index
    @users = User.order('id DESC')
  end

end
