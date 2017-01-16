class IndicadoresacumuladosController < ApplicationController
  before_action :set_indicadoresacumulado, only: [:show, :edit, :update, :destroy]

  # GET /indicadoresacumulados
  # GET /indicadoresacumulados.json
  def index
    @indicadoresacumulados = Indicadoresacumulado.all
  end

  # GET /indicadoresacumulados/1
  # GET /indicadoresacumulados/1.json
  def show
  end

  # GET /indicadoresacumulados/new
  def new
    @indicadoresacumulado = Indicadoresacumulado.new
  end

  # GET /indicadoresacumulados/1/edit
  def edit
  end

  # POST /indicadoresacumulados
  # POST /indicadoresacumulados.json
  def create
    @indicadoresacumulado = Indicadoresacumulado.new(indicadoresacumulado_params)

    respond_to do |format|
      if @indicadoresacumulado.save
        format.html { redirect_to @indicadoresacumulado, notice: 'Indicadoresacumulado was successfully created.' }
        format.json { render :show, status: :created, location: @indicadoresacumulado }
      else
        format.html { render :new }
        format.json { render json: @indicadoresacumulado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicadoresacumulados/1
  # PATCH/PUT /indicadoresacumulados/1.json
  def update
    respond_to do |format|
      if @indicadoresacumulado.update(indicadoresacumulado_params)
        format.html { redirect_to @indicadoresacumulado, notice: 'Indicadoresacumulado was successfully updated.' }
        format.json { render :show, status: :ok, location: @indicadoresacumulado }
      else
        format.html { render :edit }
        format.json { render json: @indicadoresacumulado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicadoresacumulados/1
  # DELETE /indicadoresacumulados/1.json
  def destroy
    @indicadoresacumulado.destroy
    respond_to do |format|
      format.html { redirect_to indicadoresacumulados_url, notice: 'Indicadoresacumulado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicadoresacumulado
      @indicadoresacumulado = Indicadoresacumulado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicadoresacumulado_params
      params.require(:indicadoresacumulado).permit(:id_ind_acumulado, :segmento, :isn, :resp_1_2, :resp_4_5, :resolutividad, :version, :fecha, :volumen)
    end
end
