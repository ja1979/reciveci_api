class WastePickersController < ApplicationController
  before_action :set_waste_picker, only: [:show, :edit, :update, :destroy]
  before_action :prepare_affiliations, only: [:new, :edit]


  # GET /waste_pickers
  # GET /waste_pickers.json
  def index
    @waste_pickers = WastePicker.all
  end

  # GET /waste_pickers/1
  # GET /waste_pickers/1.json
  def show
  end

  # GET /waste_pickers/new
  def new
    @waste_picker = WastePicker.new
  end

  # GET /waste_pickers/1/edit
  def edit
  end

  # POST /waste_pickers
  # POST /waste_pickers.json
  def create
    @waste_picker = WastePicker.new(waste_picker_params)

    respond_to do |format|
      if @waste_picker.save
        format.html { redirect_to @waste_picker, notice: 'Waste picker was successfully created.' }
        format.json { render :show, status: :created, location: @waste_picker }
      else
        format.html { render :new }
        format.json { render json: @waste_picker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waste_pickers/1
  # PATCH/PUT /waste_pickers/1.json
  def update
    respond_to do |format|
      if @waste_picker.update(waste_picker_params)
        format.html { redirect_to @waste_picker, notice: 'Waste picker was successfully updated.' }
        format.json { render :show, status: :ok, location: @waste_picker }
      else
        format.html { render :edit }
        format.json { render json: @waste_picker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waste_pickers/1
  # DELETE /waste_pickers/1.json
  def destroy
    @waste_picker.destroy
    respond_to do |format|
      format.html { redirect_to waste_pickers_url, notice: 'Waste picker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_waste_picker
      @waste_picker = WastePicker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def waste_picker_params
      params.require(:waste_picker).permit(:name, :birth_date, :start_date, :background, :message, :affiliation_id)
    end

    def prepare_affiliations
      @affiliations = Affiliation.all
    end
end
