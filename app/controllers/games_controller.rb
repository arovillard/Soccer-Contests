class GamesController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_contest
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  after_filter :check_winner, only: [:update, :create]

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

    def check_winner
      if @game.team_a_result != nil && @game.team_b_result != nil
        current_winners = [0]
        current_winners += Winner.where("game_id = ?", @game.id).pluck(:user_id)
        new_winners = Entry.where("game_id = ? and team_a_score = ? and team_b_score = ? and user_id not in (?)",
                    @game.id, @game.team_a_result, @game.team_b_result, current_winners)
        new_winners.each do |winner|
          taken = [0]
          raffle_number = 0
          taken += Game.find(winner.game_id).winners.pluck(:raffle_number)
          (raffle_number = rand(1..1000)) until taken.include?(raffle_number) == false
          var = Winner.new(:user_id => winner.user_id, :entry_id => winner.id, :game_id => winner.game_id, :raffle_number => raffle_number)
          var.save
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:contest_id, :team_a_name, :team_b_name, :team_a_result, :team_b_result, :game_date, :group, :active, :user_id, :entry_id, :game_id, :raffle_number)
    end
end
