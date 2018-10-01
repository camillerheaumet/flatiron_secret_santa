class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :link
      t.integer :wish_list_id

      t.timestamps
    end
  end
end
