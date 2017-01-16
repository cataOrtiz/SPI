class IndicadoresdiariosController < ApplicationController
  before_action :set_indicadoresdiario, only: [:show, :edit, :update, :destroy]

  # GET /indicadoresdiarios
  # GET /indicadoresdiarios.json
  def index
    @indicadoresdiarios = Indicadoresdiario.all
  end

  # GET /indicadoresdiarios/1
  # GET /indicadoresdiarios/1.json
  def show
  end

  # GET /indicadoresdiarios/new
  def new
    @indicadoresdiario = Indicadoresdiario.new
  end

  # GET /indicadoresdiarios/1/edit
  def edit
  end

  # POST /indicadoresdiarios
  # POST /indicadoresdiarios.json
  def create
    @indicadoresdiario = Indicadoresdiario.new(indicadoresdiario_params)

    respond_to do |format|
      if @indicadoresdiario.save
        format.html { redirect_to @indicadoresdiario, notice: 'Indicadoresdiario was successfully created.' }
        format.json { render :show, status: :created, location: @indicadoresdiario }
      else
        format.html { render :new }
        format.json { render json: @indicadoresdiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /indicadoresdiarios/1
  # PATCH/PUT /indicadoresdiarios/1.json
  def update
    respond_to do |format|
      if @indicadoresdiario.update(indicadoresdiario_params)
        format.html { redirect_to @indicadoresdiario, notice: 'Indicadoresdiario was successfully updated.' }
        format.json { render :show, status: :ok, location: @indicadoresdiario }
      else
        format.html { render :edit }
        format.json { render json: @indicadoresdiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /indicadoresdiarios/1
  # DELETE /indicadoresdiarios/1.json
  def destroy
    @indicadoresdiario.destroy
    respond_to do |format|
      format.html { redirect_to indicadoresdiarios_url, notice: 'Indicadoresdiario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_indicadoresdiario
      @indicadoresdiario = Indicadoresdiario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def indicadoresdiario_params
      params.require(:indicadoresdiario).permit(:id_ind_diario, :segmento, :isn, :resp_1_2, :resp_4_5, :resolutividad, :version, :fecha, :volumen)
    end
end
