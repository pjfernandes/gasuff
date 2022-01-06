class SamplesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @samples = Sample.all
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def new
    if current_user.admin?
      @sample = Sample.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user.admin?
      @sample = Sample.new(sample_params)
      @sample.user = current_user
      if @sample.save
        redirect_to sample_path(@sample), notice: 'Amostra cadastrada com sucesso!'
      else
        render :new
      end
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
    if current_user.admin?
      @sample = Sample.find(params[:id])
      @sample.user = current_user
      @sample.update(sample_params)
      redirect_to sample_path(@sample)
    end
  end

  def destroy
    if current_user.admin?
      @sample = Sample.find(params[:id])
      @sample.destroy
      redirect_to samples_path
    end
  end

  private
  def sample_params
    params.require(:sample).permit(:title, :content, :legend, :user_id, :photo)
  end
end
