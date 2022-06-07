class RemoveTimesFromMeetingsAndAddAsDateTime < ActiveRecord::Migration[6.1]
  def change
    remove_column :meetings, :expected_end_date
    remove_column :meetings, :actual_start_date
    remove_column :meetings, :actual_end_date
    add_column :meetings, :expected_end_date, :datetime
    add_column :meetings, :actual_start_date, :datetime
    add_column :meetings, :actual_end_date, :datetime
  end
end
