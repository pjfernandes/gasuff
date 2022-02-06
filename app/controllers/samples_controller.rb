class SamplesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @samples = Sample.global_search(params[:query]).includes(:researcher)
      @samples_for_pages = @samples.page(params[:page]).per(30)
    else
      @samples = Sample.includes(:researcher)
      @samples_for_pages = @samples.page(params[:page]).per(30)
    end

    @samples_for_export = @samples

    respond_to do |format|
      format.html #{ @samples_for_export }
      format.csv { send_data Sample.to_csv(@samples_for_export), filename: "samples.csv" }
      #format.csv { send_data to_csv(@samples_for_export), filename: "samples.csv" }
    end

    @markers = @samples_for_pages.map do |sample|
      {
        lat: sample.latitude,
        lng: sample.longitude,
        info_window: "<div class='border-bottom'>
                        <p class='text-center text-dark'><strong><i class='fas fa-info-circle text-primary'></i> <a href='#{sample_path(sample)}'> Detalhes</strong></p>
                      </div>
                      <div class='text-left text-dark mt-2'>
                        <p><i class='page-title fas fa-calendar text-primary'></i> <strong>Data:</strong> #{sample.date_sample}</p>
                        <p><i class='page-title fas fa-vial text-primary'></i> <strong>Tipo:</strong> #{sample.class_sample}</p>
                        <p><i class='page-title fas fa-user-graduate text-primary'></i> <strong>Pesquisador:</strong> #{sample.researcher.first_name.capitalize} #{sample.researcher.last_name.capitalize}</p>
                      </div>"
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

  # def to_csv(samples_for_export)
  #   CSV.generate(headers: true, col_sep: ";") do |csv|
  #     csv << ["longitude", "latitude", "class_sample"]
  #     samples_for_export.each do |sample|
  #       row = [sample.longitude, sample.latitude, sample.class_sample]
  #       csv << row
  #     end
  #   end
  # end

end
