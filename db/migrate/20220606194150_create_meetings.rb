class CreateMeetings < ActiveRecord::Migration[6.1]
  def change
    create_table :meetings do |t|
      t.time :expected_start_date
      t.time :expected_end_date
      t.integer :expected_duration
      t.time :actual_start_date
      t.time :actual_end_date
      t.integer :actual_duration
      t.integer :participants_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
