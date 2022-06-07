class Meeting < ApplicationRecord
  belongs_to :user
  validates :title, :goal, :location, :description, :start_date, presence: true
end
