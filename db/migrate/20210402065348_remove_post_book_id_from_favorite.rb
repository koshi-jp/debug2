class RemovePostBookIdFromFavorite < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :post_book_id, :string
  end
end
