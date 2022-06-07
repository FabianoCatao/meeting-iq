class ChangeTimeToDateTimeInMeetings < ActiveRecord::Migration[6.1]
  def change
    remove_column :meetings, :expected_start_date
    add_column :meetings, :expected_start_date, :datetime
  end
end
