class DraftController < ApplicationController

  def new
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

  end

end