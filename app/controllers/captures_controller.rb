class CapturesController < ApplicationController
  def index
    @captures = CapturesByDateBuilder.new(self.params).build_captures
  end

  def show
    @capture = Capture.find_by_id(params[:capture_id])
  end
end
