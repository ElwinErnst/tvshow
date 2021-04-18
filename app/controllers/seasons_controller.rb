class SeasonsController < ApplicationController
  before_action :set_season, only: %i[ show edit update destroy ]

  # GET /seasons or /seasons.json
  def index
    @seasons = Season.all

    @seasons = @seasons.joins(:film).where(:film => {:id => params[:film_id]}) if params[:film_id]
		@seasons = @seasons.where(["name LIKE :filter", :filter => ("%" + params[:filter] + "%")]) unless params[:filter].blank?

    @seasons = @seasons.joins(:episode).where(:episode => {:id => params[:episode_id]}) if params[:episode_id]
		@seasons = @seasons.where(["number LIKE :filter_ep", :filter_ep => ("%" + params[:filter_ep] + "%")]) unless params[:filter_ep].blank?
  #muestra las temporadas de la serie
  end

  # GET /seasons/1 or /seasons/1.json
  def show
  end

  # GET /seasons/new
  def new
    @season = Season.new
  end

  # GET /seasons/1/edit
  def edit
  end

  # POST /seasons or /seasons.json
  def create
    @season = Season.new(season_params)

    respond_to do |format|
      if @season.save
        format.html { redirect_to @season, notice: "Season was successfully created." }
        format.json { render :show, status: :created, location: @season }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seasons/1 or /seasons/1.json
  def update
    respond_to do |format|
      if @season.update(season_params)
        format.html { redirect_to @season, notice: "Season was successfully updated." }
        format.json { render :show, status: :ok, location: @season }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @season.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seasons/1 or /seasons/1.json
  def destroy
    @season.destroy
    respond_to do |format|
      format.html { redirect_to seasons_url, notice: "Season was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_season
      @season = Season.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def season_params
      params.require(:season).permit(:number, :begins_at, :film_id)
    end
end
