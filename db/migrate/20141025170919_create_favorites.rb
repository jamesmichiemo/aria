class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :track_id
      t.string :artist
      t.string :title
      t.string :bpm
      t.string :key
      t.references :user, index: true

      t.timestamps
    end
    add_index :favorites, [:user_id, :created_at]
  end
end
