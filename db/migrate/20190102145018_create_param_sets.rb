class CreateParamSets < ActiveRecord::Migration[5.2]
  def change
    create_table :param_sets do |t|
      t.string :productName
      t.string :productVersion
      t.string :mode
      t.text :tuneProject

      t.belongs_to :session, foreign_key:true
      t.timestamps
    end
  end
end
