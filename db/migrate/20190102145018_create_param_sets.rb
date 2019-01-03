class CreateParamsets < ActiveRecord::Migration[5.2]
  def change
    create_table :paramsets do |t|
      t.string :productName
      t.string :productVersion
      t.string :mode

      t.timestamps
    end
  end
end
