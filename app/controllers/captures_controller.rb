class CapturesController < ApplicationController
  respond_to :json, :html

  def index
    @captures = CapturesByDateBuilder.new(self.params).build_captures
    respond_with @captures
  end

  def show
    @capture = Capture.find_by_id(params[:id])
    respond_with @capture
  end
end
