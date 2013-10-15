class DraftPositionController < ApplicationController

  def create
  	@draft = Draft.where("creator_id = #{current_user.id}").last
    @rounds = @draft.rounds

    @number_of_teams = Team.all.count
    @rounds.each do |round|
      @number_of_teams.times do |i|
        DraftPosition.create(team_id: Team.find_by(name: params[:draft_order][i]).id, round_id: round.id, position: i+1)
      end
    end
    render nothing: true
  end

end