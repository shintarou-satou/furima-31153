class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :product
      t.text        :explanation
      t.integer     :category_id
      t.integer     :condition_id
      t.integer     :delivery_fee_id
      t.integer     :todoufuken_address_id
      t.integer     :shipping_time_id
      t.integer     :price
      t.references  :user, foreign_key: true
      t.timestamps
    end
  end
end
