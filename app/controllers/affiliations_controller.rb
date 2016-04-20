class AffiliationsController < ApplicationController
  before_action :set_affiliation, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

     # GET /affiliations/affiliations.json
    def last
    @affiliations = Affiliation.order('name ASC').limit(10)

    #sleep(1)

    #url_prefix = request.protocol + request.host + ":" + request.port.to_s + "/"
    
    @result = Array.new

    @affiliations.each do |affiliation|
      @result << {
        id: affiliation.id,
        nombre:affiliation.name,
        sector: affiliation.sector,
        direccion: affiliation.direccion,
        telefono: affiliation.phone1,
        email: affiliation.email,
        publish: affiliation.publish,

        }
    end

    respond_to do |format|
      format.json { render json: @result }
    end
  end

  # GET /affiliations
  # GET /affiliations.json

  def index
    @affiliations = Affiliation.all
  end

  # GET /affiliations/1
  # GET /affiliations/1.json
  def show
  end

  # GET /affiliations/new
  def new
    @affiliation = Affiliation.new
  end

  # GET /affiliations/1/edit
  def edit
  end
  

  # POST /affiliations
  # POST /affiliations.json
  def create
    @affiliation = Affiliation.new(affiliation_params)

    respond_to do |format|
      if @affiliation.save
        format.html { redirect_to @affiliation, notice: "Asociacion creada exitosamente" }
        format.json { render :show, status: :created, location: @affiliation }
      else
        format.html { render :new }
        format.json { render json: @affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /affiliations/1
  # PATCH/PUT /affiliations/1.json
  def update
    respond_to do |format|
      if @affiliation.update(affiliation_params)
        format.html { redirect_to @affiliation, notice: "Asociacion actualizada exitosamente"}
        format.json { render :show, status: :ok, location: @affiliation }
      else
        format.html { render :edit }
        format.json { render json: @affiliation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliations/1
  # DELETE /affiliations/1.json
  def destroy
    @affiliation.destroy
    respond_to do |format|
      format.html { redirect_to affiliations_url, notice: "Asociacion eliminada exitosamente" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_affiliation
      @affiliation = Affiliation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def affiliation_params
      params.require(:affiliation).permit(:name , :sector , :direccion , :phone1 ,:email , :publish)
    end
end
