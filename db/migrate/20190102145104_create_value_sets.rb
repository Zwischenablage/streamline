class CreateValueSets < ActiveRecord::Migration[5.2]
  def change
    create_table :value_sets do |t|
      t.string :name
      t.string :shortComment
      t.string :comment

      t.belongs_to :param_set, foreign_key:true
      t.timestamps
    end
  end
end
