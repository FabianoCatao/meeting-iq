class AddTitleToMeetings < ActiveRecord::Migration[6.1]
  def change
    add_column :meetings, :title, :string
    add_column :meetings, :place, :string
  end
end
