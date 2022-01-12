class CarbonsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @carbons = Carbon.all
  end

  def show
    @carbon = Carbon.find(params[:id])
  end

  def new
    @sample = Sample.new
    @carbon = Carbon.new
  end

  def create
    @carbon = Carbon.new(carbon_params)
    @carbon.user = current_user
    if @carbon.save
      redirect_to samples_path, notice: 'Amostra cadastrada com sucesso!'
    else
      render :new
    end
  end

  def edit
    if current_user.admin?
      @carbon = Carbon.find(params[:id])
    else
      redirect_to carbon_path(@carbon)
    end
  end

  def update
    @carbon = Carbon.find(params[:id])
    @carbon.user = current_user
    @carbon.update(carbon_params)
    redirect_to carbon_path(@carbon)
  end

  private
  def carbon_params
    params.require(:carbon).permit(:latitude, :longitude, :class_sample, :researcher_id, :date_sample, :date_analysis, :equipment, :user, :concentration, :ph, :temperature, :salinity)
  end
end
