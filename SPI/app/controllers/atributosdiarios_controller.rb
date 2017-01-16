class AtributosdiariosController < ApplicationController
  before_action :set_atributosdiario, only: [:show, :edit, :update, :destroy]

  # GET /atributosdiarios
  # GET /atributosdiarios.json
  def index
    @atributosdiarios = Atributosdiario.all
  end

  # GET /atributosdiarios/1
  # GET /atributosdiarios/1.json
  def show
  end

  # GET /atributosdiarios/new
  def new
    @atributosdiario = Atributosdiario.new
  end

  # GET /atributosdiarios/1/edit
  def edit
  end

  # POST /atributosdiarios
  # POST /atributosdiarios.json
  def create
    @atributosdiario = Atributosdiario.new(atributosdiario_params)

    respond_to do |format|
      if @atributosdiario.save
        format.html { redirect_to @atributosdiario, notice: 'Atributosdiario was successfully created.' }
        format.json { render :show, status: :created, location: @atributosdiario }
      else
        format.html { render :new }
        format.json { render json: @atributosdiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /atributosdiarios/1
  # PATCH/PUT /atributosdiarios/1.json
  def update
    respond_to do |format|
      if @atributosdiario.update(atributosdiario_params)
        format.html { redirect_to @atributosdiario, notice: 'Atributosdiario was successfully updated.' }
        format.json { render :show, status: :ok, location: @atributosdiario }
      else
        format.html { render :edit }
        format.json { render json: @atributosdiario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atributosdiarios/1
  # DELETE /atributosdiarios/1.json
  def destroy
    @atributosdiario.destroy
    respond_to do |format|
      format.html { redirect_to atributosdiarios_url, notice: 'Atributosdiario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_atributosdiario
      @atributosdiario = Atributosdiario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def atributosdiario_params
      params.require(:atributosdiario).permit(:id_atr_diario, :segmento, :pregunta, :valor, :version, :fecha)
    end
end
