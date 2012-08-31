class CapturesController < ApplicationController
  def index
    @captures = Capture.includes(:site)
                       .order("sites.name")
                       .where(:hour_captured => params[:hour])
  end
end
