class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :oracleID
      t.date :created_at

      t.belongs_to :customer, foreign_key: true, index: true

      t.timestamps
    end
  end
end
