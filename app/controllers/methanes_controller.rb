class MethanesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @methanes = Methane.all
  end

  def show
    @methane = Methane.find(params[:id])
  end

  def new
    @methane = Methane.new
  end

  def create
    @methane = Methane.new(methane_params)
    @methane.user = current_user
    if @methane.save
      redirect_to samples_path, notice: 'Amostra cadastrada com sucesso!'
    else
      render :new
    end
  end

  def edit
    if current_user.admin?
      @methane = Methane.find(params[:id])
    else
      redirect_to methane_path(@methane)
    end
  end

  def update
    @methane = Methane.find(params[:id])
    @methane.user = current_user
    @methane.update(methane_params)
    redirect_to methane_path(@methane)
  end

  private
  def methane_params
    params.require(:methane).permit(:latitude, :longitude, :class_sample, :researcher_id, :date_sample, :date_analysis, :equipment, :user, :concentration, :ph, :temperature, :salinity)
  end
end
