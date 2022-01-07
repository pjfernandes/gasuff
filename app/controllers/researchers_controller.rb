class ResearchersController < ApplicationController

  def index
    @researchers = Researcher.all
     @markers = @researchers.map do |researcher|
      {
        lat: researcher.latitude.round(3)+(rand()/100),
        lng: researcher.longitude.round(3)+(rand()/100),
        info_window: render_to_string(partial: "info_window_researcher", locals: { researcher: researcher })
      }
    end
  end

  def show
    @researcher = Researcher.find(params[:id])
  end

  def new
    @researcher = Researcher.new()
  end

  def create
    @researcher = Researcher.new(researcher_params)

    if @researcher.save
      redirect_to researchers_path, notice: 'Pesquisador cadastrado com sucesso'
    else
      render :new
    end
  end

  private
  def researcher_params
    params.require(:researcher).permit(:first_name, :last_name, :email, :institution, :city, :nation)
  end

end
