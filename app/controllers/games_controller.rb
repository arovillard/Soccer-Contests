class GamesController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_contest
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = @contest.games
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = @contest.games.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = @contest.games.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to contest_games_path, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to contest_games_path, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to contest_games_path }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:contest_id, :team_a_name, :team_b_name, :team_a_result, :team_b_result, :game_date, :group)
    end
end
