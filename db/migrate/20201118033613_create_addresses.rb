class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string      :postal_code,            default: "",  null: false
      t.integer     :todoufuken_address_id,                null: false
      t.string      :shityouson_address,     default: "",  null: false 
      t.string      :banchi_address,         default: "",  null: false  
      t.string      :building    
      t.string      :phone_number,           default: "",  null: false
      t.references  :order,                  null: false,  foreign_key: true
      t.timestamps
    end
  end
end
