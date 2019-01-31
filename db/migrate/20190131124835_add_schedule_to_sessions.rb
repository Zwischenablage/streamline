class AddScheduleToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :requestDate, :date
    add_column :sessions, :duration, :integer
  end
end
