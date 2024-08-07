class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post, :prefecture_id, :municipalities,
                :street_address, :building_name, :phone_number, :purchase_id,
                :token

  with_options presence: true do
    validates :user_id, :item_id, :municipalities, :street_address, :token
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)', allow_blank: true }
    validates :phone_number,
              format: { with: /\A\d{10,11}\z/, message: 'must be a number between 10 and 11 digits.', allow_blank: true }
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    purchase = Purchase.create(user_id:, item_id:)
    Address.create(post:, prefecture_id:, municipalities:,
                   street_address:, building_name:,
                   phone_number:, purchase_id: purchase.id)
  end
end
