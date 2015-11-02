class LineStringsController < ApplicationController
  
  before_action :set_line_string, only: [:show, :edit, :update, :destroy]

  before_action :prepare_routes, only: [:new, :edit]


  # GET /line_strings
  # GET /line_strings.json
  def index
    @line_strings = LineString.all
  end

  # GET /line_strings/1
  # GET /line_strings/1.json
  def show
  end

  # GET /line_strings/new
  def new
    @line_string = LineString.new
  end

  # GET /line_strings/1/edit
  def edit
  end

  # POST /line_strings
  # POST /line_strings.json
  def create
    @line_string = LineString.new(line_string_params)

    respond_to do |format|
      if @line_string.save
        format.html { redirect_to @line_string, notice: 'Line string was successfully created.' }
        format.json { render :show, status: :created, location: @line_string }
      else
        format.html { render :new }
        format.json { render json: @line_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_strings/1
  # PATCH/PUT /line_strings/1.json
  def update
    respond_to do |format|
      if @line_string.update(line_string_params)
        format.html { redirect_to @line_string, notice: 'Line string was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_string }
      else
        format.html { render :edit }
        format.json { render json: @line_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_strings/1
  # DELETE /line_strings/1.json
  def destroy
    @line_string.destroy
    respond_to do |format|
      format.html { redirect_to line_strings_url, notice: 'Line string was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_string
      @line_string = LineString.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_string_params
      params.require(:line_string).permit(:name, :coordinates)
    end

    def prepare_routes
      @routes = Route.all
    end
end
