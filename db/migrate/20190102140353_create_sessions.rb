class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :session_type
      t.string :description
      t.date :finished_at
      t.string :vehicle
      t.integer :session_state
      t.string :project_file

      t.belongs_to :project, foreign_key: true, index: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
