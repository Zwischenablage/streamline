class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :description
      t.datetime :finished_at
      t.string :vehicle
      t.integer :state

      t.belongs_to :project, foreign_key: true, index: true
      t.references :session_type, foreign_key: true

      t.timestamps
    end
  end
end
