class CreateFavourites < ActiveRecord::Migration[5.2]
  def change
    create_table :favourites do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.boolean :favourite, default: false

      t.timestamps
    end
  end
end
