class CreateSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :songs do |t|
      t.string :artist
      t.string :title
      t.integer :count
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
