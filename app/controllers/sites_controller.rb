class SitesController < ApplicationController
  def index
    @sites = Site.order("name").includes(:captures)
    @current_datetime = @sites.first.updated_at
  end
end
