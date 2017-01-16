class ConfiguracionesController < ApplicationController
  before_action :set_ponderacion, only: [:show, :edit, :update, :destroy]

  def index
    @ponderacions = Ponderacion.all
  end


end
