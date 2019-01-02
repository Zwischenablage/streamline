class CreateSessionTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :session_types do |t|
      t.string :type

      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end
