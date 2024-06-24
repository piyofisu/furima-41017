class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :until_shipping

  validates :name, :description, :image, presence: true
  validates :category_id, :condition_id, :charge_id,:prefecture_id, 
    :until_shipping_id, numericality: { 
    other_than: 1 , message: "cant't be blank"
    }
  validates :price, numericality: { 
    only_integer: true,
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999 
    }, 
    format: { with: /\A[0-9]+\z/ }, allow_blank: true
end