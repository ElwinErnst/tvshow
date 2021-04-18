class CreateSeasons < ActiveRecord::Migration[6.1]
  def change
    create_table :seasons do |t|
      t.integer :number
      t.datetime :begins_at
      t.references :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end
