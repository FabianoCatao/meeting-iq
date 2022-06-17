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
    @places = ['Remote', 'Room 405', 'Room 406', 'Room 407', 'Room 505']
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.user = current_user
    @meeting.expected_duration = ((@meeting.expected_end_date - @meeting.expected_start_date) / 60).round
    if @meeting.save
      redirect_to meeting_path(@meeting), notice: "Meeting successfully scheduled"
    else
      render :new
    end
  end

  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy
    redirect_to upcoming_meetings_path, notice: "Meeting deleted"
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :expected_start_date, :expected_end_date, :participants_number, :place)
  end
end
