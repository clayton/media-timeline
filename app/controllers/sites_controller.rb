class SitesController < ApplicationController
  def index
    @sites = Site.order("updated_at").includes(:captures)
  end
end
