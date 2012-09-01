class CapturesController < ApplicationController
  before_filter :parse_dates

  def index
    @captures = Capture.includes(:site)
                       .order("sites.name")
                       .where(:year_captured => @year)
                       .where(:month_captured => @month)
                       .where(:day_captured => @day)
                       .where(:hour_captured => @hour)
  end

private
  def parse_dates
    @year  = params[:year] || Time.now.year
    @month = params[:month] || Time.now.month
    @day   = params[:day] || Time.now.day
    @hour  = params[:hour] || Time.now.hour
  end
end
