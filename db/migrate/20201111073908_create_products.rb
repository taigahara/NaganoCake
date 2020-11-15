class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|

      t.integer :genre_id
      t.string :name
      t.boolean :is_sold
      t.text :explanation
      t.integer :price
      t.string :image_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
