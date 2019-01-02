class CreateValueSetMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :value_set_maps do |t|
      t.references :param_set, foreign_key: true
      t.references :value_set, foreign_key: true

      t.timestamps
    end
  end
end
