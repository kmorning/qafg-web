class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.order(:day, :time)
  end
end
