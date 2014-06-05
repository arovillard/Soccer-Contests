class ContestsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_contest, only: [:show, :edit, :update, :destroy]

  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.all.where(:active => true)
    @next_games = Game.where({:active => true, :team_a_result => nil, :team_b_result => nil}).where("game_date > ?", Time.zone.now + 5.hour).limit(5)
    @latest_scores = Game.where.not({:team_a_result => nil, :team_b_result => nil}).where("game_date < ?", Time.zone.now).order(game_date: :asc).limit(5)
    @comments = Comment.order('created_at DESC').limit(5).reverse
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    items = current_user.entries.where(:contest_id => @contest.id).pluck(:game_id)
    @games = @contest.games.where.not(:id => items).where({:active => true, :team_a_result => nil, :team_b_result => nil})
    @results = @contest.games.where(:id => items)
  end

  # GET /contests/new
  def new
    @contest = Contest.new
  end

  # GET /contests/1/edit
  def edit
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = Contest.new(contest_params)

    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'Contest was successfully created.' }
        format.json { render action: 'show', status: :created, location: @contest }
      else
        format.html { render action: 'new' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contests/1
  # PATCH/PUT /contests/1.json
  def update
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'Contest was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contest
      @contest = Contest.find(params[:id])
      @entries = @contest.entries.where(:user_id => current_user).where("created_at > ?", Time.zone.now - 5.days)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contest_params
      params.require(:contest).permit(:name, :active, entries_attributes: [:id, :team_a_name, :team_b_name, :team_a_score, :team_b_score, :game_id, :user_id])
    end
end
