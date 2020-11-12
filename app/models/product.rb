class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :todoufuken_address
  belongs_to :shipping_time
  
  has_one :bought
  belongs_to :user
  has_one_attached :image

  with_options presence: true  do
    validates :image
    validates :product
    validates :explanation
  end

  with_options  numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id   
    validates :todoufuken_address_id 
    validates :shipping_time_id    
  end

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300,  less_than_or_equal_to:9999999, message: "is out of setting range"}
  validates :price, format: {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}

end
