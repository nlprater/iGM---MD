class DraftController < ApplicationController

  def new
  	@draft = Draft.new
    @teams = Team.all
    @afc_north = Team.where(division: 'AFC North')
    @afc_east = Team.where(division: 'AFC East')
    @afc_south = Team.where(division: 'AFC South')
    @afc_west = Team.where(division: 'AFC West')
    @nfc_north = Team.where(division: 'NFC North')
    @nfc_east = Team.where(division: 'NFC East')
    @nfc_south = Team.where(division: 'NFC South')
    @nfc_west = Team.where(division: 'NFC West')
  end

  def create
    @draft = Draft.create(name: params[:name],creator_id: current_user.id, number_of_gms: params[:number_of_gms].to_i,number_of_rounds: params[:number_of_rounds].to_i,access: params[:access],draft_type: params[:draft_type])

    params[:number_of_rounds].to_i.times do |i|
      Round.create(draft_id: @draft.id, draft_round_number: i+1)
    end

    render nothing: true
  end

end