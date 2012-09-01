class CapturesController < ApplicationController
  def index
    @captures = Capture.includes(:site)
                       .order("sites.name")
                       .where(:year_captured => params[:year])
                       .where(:month_captured => params[:month])
                       .where(:day_captured => params[:day])
                       .where(:hour_captured => params[:hour])
  end
end
