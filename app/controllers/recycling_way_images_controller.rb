class RecyclingWayImagesController < ApplicationController
  before_action :set_recycling_way_image, only: [:show, :edit, :update, :destroy]

  # GET /recycling_way_images
  # GET /recycling_way_images.json
  def index
    @recycling_way_images = RecyclingWayImage.all
  end

  # GET /recycling_way_images/1
  # GET /recycling_way_images/1.json
  def show
  end

  # GET /recycling_way_images/new
  def new
    @recycling_way_image = RecyclingWayImage.new
  end

  # GET /recycling_way_images/1/edit
  def edit
  end

  # POST /recycling_way_images
  # POST /recycling_way_images.json
  def create
    @recycling_way_image = RecyclingWayImage.new(recycling_way_image_params)

    respond_to do |format|
      if @recycling_way_image.save
        format.html { redirect_to @recycling_way_image, notice: 'Recycling way image was successfully created.' }
        format.json { render :show, status: :created, location: @recycling_way_image }
      else
        format.html { render :new }
        format.json { render json: @recycling_way_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recycling_way_images/1
  # PATCH/PUT /recycling_way_images/1.json
  def update
    respond_to do |format|
      if @recycling_way_image.update(recycling_way_image_params)
        format.html { redirect_to @recycling_way_image, notice: 'Recycling way image was successfully updated.' }
        format.json { render :show, status: :ok, location: @recycling_way_image }
      else
        format.html { render :edit }
        format.json { render json: @recycling_way_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recycling_way_images/1
  # DELETE /recycling_way_images/1.json
  def destroy
    @recycling_way_image.destroy
    respond_to do |format|
      format.html { redirect_to recycling_way_images_url, notice: 'Recycling way image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def by_recycling_way
    @images = RecyclingWayImage.where(recyclingWay_id: params[:recycling_way_id])
    respond_to do |format|
      format.json { render json:@images }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recycling_way_image
      @recycling_way_image = RecyclingWayImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recycling_way_image_params
      params.require(:recycling_way_image).permit(:title, :url, :recyclingWay_id)
    end
end
