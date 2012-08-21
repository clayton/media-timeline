class SitesController < ApplicationController
  def index
    @sites = Site.order("name").includes(:captures)
  end
end
