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
    if current_user.admin?
      @water = Water.find(params[:id])
    else
      redirect_to water_path(@water)
    end
  end

  def update
    @water = Water.find(params[:id])
    @water.user = current_user
    @water.update(water_params)
    redirect_to water_path(@water)
  end

  private
  def water_params
    params.require(:water).permit(
      :latitude, :longitude, :class_sample, :researcher_id, :date_sample,
      :date_analysis, :equipment, :user,
    )
  end
end
