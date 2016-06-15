class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    # returns upcoming matches in order
    @matches = Match.all.order(time: :asc)
  end

  def show
    @player1 = Player.find(@match.players[0])
    @player2 = Player.find(@match.players[1])
  end

  def new
    @match = Match.new
  end

  def edit
  end

  def create
    @match = Match.new(match_params)
    player_1 = Player.find(@match.player_1)
    player_2 = Player.find(@match.player_2)
    @match.save
    @match.games.create(player: player_1)
    @match.games.create(player: player_2)
    @match.save

    respond_to do |format|
      if @match.save
        format.html { redirect_to @match }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # if @match.player_1_score > @match.
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

  def match_params
    params.require(:match).permit(
      :time,
      :player_1,
      :player_1_score,
      :player_2,
      :player_2_score
    )
  end
end
