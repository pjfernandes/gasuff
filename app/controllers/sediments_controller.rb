class SedimentsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

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
      :latitude, :longitude, :class_sample, :researcher_id, :date_sample,
      :date_analysis, :equipment, :user,
      :p_total, :cinorg, :c_total, :calcidif, :n_total, :delta_13c, :delta_15n
    )
  end
end
