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

  validates :image,                 presence: true
  validates :product,               presence: true
  validates :explanation,           presence: true
  validates :category_id,           numericality: { other_than: 1 } 
  validates :condition_id,          numericality: { other_than: 1 } 
  validates :delivery_fee_id,       numericality: { other_than: 1 } 
  validates :todoufuken_address_id, numericality: { other_than: 1 } 
  validates :shipping_time_id,      numericality: { other_than: 1 } 
  validates :price,                 presence: true, numericality: { greater_than_or_equal_to: 300,  less_than_or_equal_to:9999999, message: "is out of setting range"}
  validates :price,                 format:       {with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}

end
