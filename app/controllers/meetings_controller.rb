class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.where(user_id: current_user.id)
  end

  def upcoming
    @meetings = Meeting.where(user_id: current_user.id)
    @upcoming_meetings = @meetings.where('expected_start_date > ?', DateTime.now)
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

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
    params.require(:meeting).permit(:expected_start_date, :expected_end_date)
  end
end
