class CreateParameters < ActiveRecord::Migration[5.2]
  def change
    create_table :parameters do |t|
      t.string :name
      t.string :value

      t.belongs_to :value_set, foreign_key:true
      t.timestamps
    end
  end
end
