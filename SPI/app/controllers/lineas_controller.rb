class LineasController < ApplicationController
  before_action :set_linea, only: [:show, :edit, :update, :destroy]

  # GET /lineas
  # GET /lineas.json
  def index
    @lineas = Linea.all
  end

  # GET /lineas/1
  # GET /lineas/1.json
  def show
  end

  # GET /lineas/new
  def new
    @linea = Linea.new
  end

  # GET /lineas/1/edit
  def edit
  end

  # POST /lineas
  # POST /lineas.json
  def create
    @linea = Linea.new(linea_params)

    respond_to do |format|
      if @linea.save
        format.html { redirect_to @linea, notice: 'Linea was successfully created.' }
        format.json { render :show, status: :created, location: @linea }
      else
        format.html { render :new }
        format.json { render json: @linea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lineas/1
  # PATCH/PUT /lineas/1.json
  def update
    respond_to do |format|
      if @linea.update(linea_params)
        format.html { redirect_to @linea, notice: 'Linea was successfully updated.' }
        format.json { render :show, status: :ok, location: @linea }
      else
        format.html { render :edit }
        format.json { render json: @linea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineas/1
  # DELETE /lineas/1.json
  def destroy
    @linea.destroy
    respond_to do |format|
      format.html { redirect_to lineas_url, notice: 'Linea was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_linea
      @linea = Linea.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def linea_params
      params.require(:linea).permit(:id_linea, :numero_cliente, :cliente_id, :segmento_id, :fijomovil_id, :contrato_id)
    end
end
