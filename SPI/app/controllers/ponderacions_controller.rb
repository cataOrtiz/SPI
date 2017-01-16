class PonderacionsController < ApplicationController
  before_action :set_ponderacion, only: [:show, :edit, :update, :destroy]

  # GET /ponderacions
  # GET /ponderacions.json
  def index
    @ponderacions = Ponderacion.all
  end

  # GET /ponderacions/1
  # GET /ponderacions/1.json
  def show
  end

  # GET /ponderacions/new
  def new
    @ponderacion = Ponderacion.new
  end

  # GET /ponderacions/1/edit
  def edit
  end

  # POST /ponderacions
  # POST /ponderacions.json
  def create
    @ponderacion = Ponderacion.new(ponderacion_params)

    respond_to do |format|
      if @ponderacion.save
        format.html { redirect_to @ponderacion, notice: 'Ponderacion was successfully created.' }
        format.json { render :show, status: :created, location: @ponderacion }
      else
        format.html { render :new }
        format.json { render json: @ponderacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ponderacions/1
  # PATCH/PUT /ponderacions/1.json
  def update
    respond_to do |format|
      if @ponderacion.update(ponderacion_params)
        format.html { redirect_to @ponderacion, notice: 'La ponderación ha sido correctamente actualizada.' }
        format.json { render :show, status: :ok, location: @ponderacion }
      else
        format.html { render :edit }
        format.json { render json: @ponderacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ponderacions/1
  # DELETE /ponderacions/1.json
  def destroy
    @ponderacion.destroy
    respond_to do |format|
      format.html { redirect_to ponderacions_url, notice: 'Ponderacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ponderacion
      @ponderacion = Ponderacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ponderacion_params
      params.require(:ponderacion).permit(:id_ponderacion, :segmento, :valor, :fecha)
    end
end
