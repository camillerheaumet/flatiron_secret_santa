class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :name
      t.integer :price
      t.string :description
      t.integer :wishlist_id

      t.timestamps
    end
  end
end
