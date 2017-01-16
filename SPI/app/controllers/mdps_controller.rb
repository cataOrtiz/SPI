class MdpsController < ApplicationController
  before_action :set_mdp, only: [:show, :edit, :update, :destroy]

  # GET /mdps
  # GET /mdps.json
  def index
    @mdps = Mdp.all
  end

  # GET /mdps/1
  # GET /mdps/1.json
  def show
  end

  # GET /mdps/new
  def new
    @mdp = Mdp.new
  end

  # GET /mdps/1/edit
  def edit
  end

  # POST /mdps
  # POST /mdps.json
  def create
    @mdp = Mdp.new(mdp_params)

    respond_to do |format|
      if @mdp.save
        format.html { redirect_to @mdp, notice: 'Mdp was successfully created.' }
        format.json { render :show, status: :created, location: @mdp }
      else
        format.html { render :new }
        format.json { render json: @mdp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdps/1
  # PATCH/PUT /mdps/1.json
  def update
    respond_to do |format|
      if @mdp.update(mdp_params)
        format.html { redirect_to @mdp, notice: 'Mdp was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdp }
      else
        format.html { render :edit }
        format.json { render json: @mdp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdps/1
  # DELETE /mdps/1.json
  def destroy
    @mdp.destroy
    respond_to do |format|
      format.html { redirect_to mdps_url, notice: 'Mdp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdp
      @mdp = Mdp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdp_params
      params.require(:mdp).permit(:id_mdp, :nombre_mdp)
    end
end
