class MeetingsController < ApplicationController
  def new
    @meeting = Meeting.new
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    if @meeting.save
      redirect_to meeting_path(@meeting), notice: "Meeting successfully scheduled"
    else
      render :new
    end
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :goal, :start_date, :location, :description)
  end
end
