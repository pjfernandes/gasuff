class GasesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new]

  def index
    @gases = Gase.all
  end

  def show
    @gase = Gase.find(params[:id])
  end

  def new
    @gase = Gase.new
  end

  def create
    @gase = Gase.new(gase_params)
    @gase.user = current_user
    if @gase.save
      redirect_to samples_path, notice: 'Amostra cadastrada com sucesso!'
    else
      render :new
    end
  end

  def edit
    #if current_user.admin?
      @gase = Gase.find(params[:id])
    #else
    #  redirect_to gase_path(@gase)
    #end
  end

  def update
    @gase = Gase.find(params[:id])
    @gase.user = current_user
    @gase.update(gase_params)
    redirect_to sample_path(@gase)
  end

  private
  def gase_params
    params.require(:gase).permit(
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
