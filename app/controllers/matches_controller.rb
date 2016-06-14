class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  def show
  end

  def new
    @match = Match.new
  end

  def edit
  end

  def create
    @match = Match.new(match_params)
    @players = Player.where(id: params[:organizing_team])
    @match.players << @players

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @players = Player.where(id: params[:organizing_team])
    @match.players.destroy_all
    @match.players << @players

    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :no_content }
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.require(:match).permit(
        :winner_id,
        :winner_score,
        :loser_id,
        :loser_score,
        :time
      )
    end
end
