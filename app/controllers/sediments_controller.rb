class SedimentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new]

  def index
    @sediments = Sediment.all
  end

  def show
    @sediment = Sediment.find(params[:id])
  end

  def new
    @sediment = Sediment.new
  end

  def create
    @sediment = Sediment.new(sediment_params)
    @sediment.user = current_user
    if @sediment.save
      redirect_to samples_path, notice: 'Amostra cadastrada com sucesso!'
    else
      render :new
    end
  end

  def edit
    if current_user.admin?
      @sediment = Sediment.find(params[:id])
    else
      redirect_to sediment_path(@sediment)
    end
  end

  def update
    @sediment = Sediment.find(params[:id])
    @sediment.user = current_user
    @sediment.update(sediment_params)
    redirect_to sediment_path(@sediment)
  end

  private
  def sediment_params
    params.require(:sediment).permit(
      :latitude,
      :longitude,
      :ecosystem,
      :class_sample,
      :researcher_id,
      :date_sample,
      :date_analysis,
      :entry_date,
      :history,
      :location,
      :cod_sample,
      :observation,
      :remineralization,
      :sediment_co2,
      :sediment_ch4,
      :sediment_n2o,
      :carbon,
      :nitrogen,
      :sand,
      :silt,
      :clay,
      :delta_13c,
      :delta_15_n,
      :density,
      :user
    )
  end
end
