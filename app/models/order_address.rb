class OrderAddress

  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :todoufuken_address_id, :shityouson_address, :banchi_address, :building, :phone_number, :order, :token
  

 with_options  presence: true do
    validates :postal_code,             format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :todoufuken_address_id,   numericality: { other_than: 0, message: "can't be blank" }
    validates :shityouson_address
    validates :banchi_address
    validates :phone_number,    format: {with: /\A[0-9]{1,11}\z/, message: "is invalid."}
    validates :token
  end

  def save
      order = Order.create(user_id: user_id, product_id: product_id)
      Address.create(postal_code: postal_code, todoufuken_address_id: todoufuken_address_id, shityouson_address: shityouson_address, banchi_address: banchi_address, building: building, phone_number: phone_number, order_id: order.id)
  end

end