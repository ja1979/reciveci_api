class DashboardController < ApplicationController
	before_filter :authenticate_user!
  

  # GET /user
  # GET /user.json
  def index
    @users = User.order('id DESC')
  end

end
