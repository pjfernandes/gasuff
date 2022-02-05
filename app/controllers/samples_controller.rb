require 'csv'

class SamplesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @samples = Sample.global_search(params[:query]).includes(:researcher).page(params[:page]).per(30)
    else
      @samples = Sample.includes(:researcher).page(params[:page]).per(30)
    end
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
    @markers = [
      {
        lat: @sample.latitude,
        lng: @sample.longitude,
        info_window: render_to_string(partial: "info_location", locals: { sample: @sample })
      }
    ]
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
    params.require(:sample).permit(
      :latitude, :longitude, :class_sample, :researcher_id, :date_sample,
      :date_analysis, :equipment, :user, :concentration, :ph, :temperature, :salinity,
      :p_total, :cinorg, :c_total, :calcidif, :n_total, :delta_13c, :delta_15n
    )
  end
end
