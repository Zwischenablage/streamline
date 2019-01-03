class CreateValuesets < ActiveRecord::Migration[5.2]
  def change
    create_table :valuesets do |t|
      t.string :name
      t.string :shortComment
      t.string :comment
      t.text :value

      t.timestamps
    end
  end
end
