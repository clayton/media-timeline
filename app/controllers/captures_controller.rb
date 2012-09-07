class CapturesController < ApplicationController
  def index
    @captures = CapturesByDateBuilder.new(self.params).build_captures
  end
end
