class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :session_type
      t.string :description
      t.date :finished_at
      t.string :vehicle
      t.integer :state

      t.belongs_to :project, foreign_key: true, index: true
      t.timestamps
    end
  end
end
