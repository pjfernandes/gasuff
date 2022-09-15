class WatersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new]

  def index
    @waters = Water.all
  end

  def show
    @water = Water.find(params[:id])
  end

  def new
    @water = Water.new
  end

  def create
    @water = Water.new(water_params)
    @water.user = current_user
    if @water.save
      redirect_to samples_path, notice: 'Amostra cadastrada com sucesso!'
    else
      render :new
    end
  end

  def edit
    #if current_user.admin?
      @water = Water.find(params[:id])
    #else
     # redirect_to water_path(@water)
    #end
  end

  def update
    @water = Water.find(params[:id])
    @water.user = current_user
    @water.update(water_params)
    redirect_to sample_path(@water)
  end

  private
  def water_params
    params.require(:water).permit(
    :user,
    :researcher_id,
    :type,
    :latitude,
    :longitude,
    :date_sample,
    :date_analysis,
    :entry_date,
    :exit_date,
    :location,
    :history,
    :cod_sample,
    :observation,
    :class_sample,
    :remineralization,
    :ecosystem,
    :sediment_co2,
    :sediment_ch4,
    :sediment_n2o,
    :carbon,
    :nitrogen,
    :sand,
    :silt,
    :clay,
    :delta_13c,
    :delta_15n,
    :density,
    :water_type,
    :water_co2,
    :water_ch4,
    :water_n2o,
    :gas_type,
    :chamber_type,
    :gase_co2,
    :gase_ch4,
    :gase_n2o
    )
  end
end
