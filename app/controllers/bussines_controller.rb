class BussinesController < ApplicationController
  before_action :set_bussine, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bussines = Bussine.all
    respond_with(@bussines)
  end

  def show
    respond_with(@bussine)
  end

  def new
    @bussine = Bussine.new
    respond_with(@bussine)
  end

  def edit
  end

  def create
    @bussine = Bussine.new(bussine_params)
    @bussine.save
    respond_with(@bussine)
  end

  def update
    @bussine.update(bussine_params)
    respond_with(@bussine)
  end

  def destroy
    @bussine.destroy
    respond_with(@bussine)
  end

  private
    def set_bussine
      @bussine = Bussine.find(params[:id])
    end

    def bussine_params
      params.require(:bussine).permit(:name, :address, :latitude, :longitude)
    end
end
