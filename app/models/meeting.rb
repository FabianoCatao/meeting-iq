class Meeting < ApplicationRecord
  belongs_to :user

  validates :title, length: { in: 6..30 }
  validates :expected_start_date, presence: true, uniqueness: { scope: :user_id, message: "already booked for a meeting" }
  validates :expected_end_date, presence: true
  validates :participants_number, presence: true
end
