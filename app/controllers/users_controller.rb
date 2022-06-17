class UsersController < ApplicationController
  def dashboard
    @meetings = Meeting.where(user_id: current_user.id)
    saved_time = @meetings.map do |meeting|
      if meeting.actual_duration.present?
        (meeting.expected_duration - meeting.actual_duration) * meeting.participants_number
      else
        0
      end
    end
    @saved = saved_time.sum
    if @saved >= 0
      @result = "Time Saved: #{@saved} minutes"
    else
      @result = "Time Wasted: #{@saved / -1} minutes"
    end
  end
end
