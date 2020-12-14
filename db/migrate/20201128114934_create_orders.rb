class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :end_user_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.boolean :payment_method
      t.integer :status, default: 0
      t.integer :total_fee
      t.integer :postage
      t.timestamps
    end
  end
end
