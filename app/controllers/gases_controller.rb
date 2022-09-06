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
    if current_user.admin?
      @gase = Gase.find(params[:id])
    else
      redirect_to gase_path(@gase)
    end
  end

  def update
    @gase = Gase.find(params[:id])
    @gase.user = current_user
    @gase.update(gase_params)
    redirect_to gase_path(@gase)
  end

  private
  def gase_params
    params.require(:gase).permit(
      :latitude, :longitude, :class_sample, :researcher_id, :date_sample,
      :date_analysis, :equipment, :user,
    )
  end
end
