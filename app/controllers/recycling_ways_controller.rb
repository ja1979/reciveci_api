class RecyclingWaysController < ApplicationController
  before_action :set_recycling_way, only: [:show, :edit, :update, :destroy]

  # GET /recycling_ways
  # GET /recycling_ways.json
  def index
    @recycling_ways = RecyclingWay.all
  end

  # GET /recycling_ways/1
  # GET /recycling_ways/1.json
  def show
  end

  # GET /recycling_ways/new
  def new
    @recycling_way = RecyclingWay.new
  end

  # GET /recycling_ways/1/edit
  def edit
  end

  # POST /recycling_ways
  # POST /recycling_ways.json
  def create
    @recycling_way = RecyclingWay.new(recycling_way_params)

    respond_to do |format|
      if @recycling_way.save
        format.html { redirect_to @recycling_way, notice: 'Recycling way was successfully created.' }
        format.json { render :show, status: :created, location: @recycling_way }
      else
        format.html { render :new }
        format.json { render json: @recycling_way.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recycling_ways/1
  # PATCH/PUT /recycling_ways/1.json
  def update
    respond_to do |format|
      if @recycling_way.update(recycling_way_params)
        format.html { redirect_to @recycling_way, notice: 'Recycling way was successfully updated.' }
        format.json { render :show, status: :ok, location: @recycling_way }
      else
        format.html { render :edit }
        format.json { render json: @recycling_way.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recycling_ways/1
  # DELETE /recycling_ways/1.json
  def destroy
    @recycling_way.destroy
    respond_to do |format|
      format.html { redirect_to recycling_ways_url, notice: 'Recycling way was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
  def by_subcategory
    @ways = RecyclingWay.where(subcategory_id: params[:subcategory_id])
    respond_to do |format|
      format.json { render json:@ways }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recycling_way
      @recycling_way = RecyclingWay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recycling_way_params
      params.require(:recycling_way).permit(:title, :description, :subcategory_id)
    end
end
