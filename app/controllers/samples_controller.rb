class SamplesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @samples = Sample.includes(:researcher)

    @markers = @samples.map do |sample|
      {
        lat: sample.latitude,
        lng: sample.longitude,
        info_window: render_to_string(partial: "info_window", locals: { sample: sample })
      }
    end
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(sample_params)
    @sample.user = current_user
    if @sample.save
      redirect_to samples_path, notice: 'Amostra cadastrada com sucesso!'
    else
      render :new
    end
  end

  def edit
    if current_user.admin?
      @sample = Sample.find(params[:id])
    else
      redirect_to sample_path(@sample)
    end
  end

  def update
    @sample = Sample.find(params[:id])
    @sample.user = current_user
    @sample.update(sample_params)
    redirect_to sample_path(@sample)
  end

  private
  def sample_params
    params.require(:sample).permit(:latitude, :longitude, :class_sample, :researcher_id, :date_sample, :date_analysis, :equipment, :user)
  end
end
