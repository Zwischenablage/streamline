class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.sring :name
      t.string :description
      t.integer :oracleID
      t.date :created_at

      t.timestamps
    end
  end
end
