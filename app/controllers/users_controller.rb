class UsersController < ApplicationController
  def dashboard
    @meetings = Meeting.where(user_id: current_user.id)
  end
end
