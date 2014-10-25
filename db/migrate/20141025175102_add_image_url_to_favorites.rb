class AddImageUrlToFavorites < ActiveRecord::Migration
  def change
    add_column :favorites, :image_url, :string
  end
end
