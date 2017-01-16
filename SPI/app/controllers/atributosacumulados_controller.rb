class AtributosacumuladosController < ApplicationController
  before_action :set_atributosacumulado, only: [:show, :edit, :update, :destroy]

  # GET /atributosacumulados
  # GET /atributosacumulados.json
  def index
    @atributosacumulados = Atributosacumulado.all
  end

  # GET /atributosacumulados/1
  # GET /atributosacumulados/1.json
  def show
  end

  # GET /atributosacumulados/new
  def new
    @atributosacumulado = Atributosacumulado.new
  end

  # GET /atributosacumulados/1/edit
  def edit
  end

  # POST /atributosacumulados
  # POST /atributosacumulados.json
  def create
    @atributosacumulado = Atributosacumulado.new(atributosacumulado_params)

    respond_to do |format|
      if @atributosacumulado.save
        format.html { redirect_to @atributosacumulado, notice: 'Atributosacumulado was successfully created.' }
        format.json { render :show, status: :created, location: @atributosacumulado }
      else
        format.html { render :new }
        format.json { render json: @atributosacumulado.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atributosacumulados/1
  # PATCH/PUT /atributosacumulados/1.json
  def update
    respond_to do |format|
      if @atributosacumulado.update(atributosacumulado_params)
        format.html { redirect_to @atributosacumulado, notice: 'Atributosacumulado was successfully updated.' }
        format.json { render :show, status: :ok, location: @atributosacumulado }
      else
        format.html { render :edit }
        format.json { render json: @atributosacumulado.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atributosacumulados/1
  # DELETE /atributosacumulados/1.json
  def destroy
    @atributosacumulado.destroy
    respond_to do |format|
      format.html { redirect_to atributosacumulados_url, notice: 'Atributosacumulado was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atributosacumulado
      @atributosacumulado = Atributosacumulado.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atributosacumulado_params
      params.require(:atributosacumulado).permit(:id_atr_acum, :segmento, :pregunta, :valor, :version, :fecha)
    end
end
