class GmStintController < ApplicationController

  def create
    p params[:teams]


    render nothing: true
  end
end