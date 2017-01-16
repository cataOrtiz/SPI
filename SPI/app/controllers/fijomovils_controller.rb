class FijomovilsController < ApplicationController
  before_action :set_fijomovil, only: [:show, :edit, :update, :destroy]

  # GET /fijomovils
  # GET /fijomovils.json
  def index
    @fijomovils = Fijomovil.all
  end

  # GET /fijomovils/1
  # GET /fijomovils/1.json
  def show
  end

  # GET /fijomovils/new
  def new
    @fijomovil = Fijomovil.new
  end

  # GET /fijomovils/1/edit
  def edit
  end

  # POST /fijomovils
  # POST /fijomovils.json
  def create
    @fijomovil = Fijomovil.new(fijomovil_params)

    respond_to do |format|
      if @fijomovil.save
        format.html { redirect_to @fijomovil, notice: 'Fijomovil was successfully created.' }
        format.json { render :show, status: :created, location: @fijomovil }
      else
        format.html { render :new }
        format.json { render json: @fijomovil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fijomovils/1
  # PATCH/PUT /fijomovils/1.json
  def update
    respond_to do |format|
      if @fijomovil.update(fijomovil_params)
        format.html { redirect_to @fijomovil, notice: 'Fijomovil was successfully updated.' }
        format.json { render :show, status: :ok, location: @fijomovil }
      else
        format.html { render :edit }
        format.json { render json: @fijomovil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fijomovils/1
  # DELETE /fijomovils/1.json
  def destroy
    @fijomovil.destroy
    respond_to do |format|
      format.html { redirect_to fijomovils_url, notice: 'Fijomovil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fijomovil
      @fijomovil = Fijomovil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fijomovil_params
      params.require(:fijomovil).permit(:id_fijomovil, :tipo_fijomovil)
    end
end
