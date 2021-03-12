class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address_line1,:address_line2,:phone_number,
                :order_id,:user_id,:item_id,:order,:token

  with_options presence: true do
    validates :postal_code,format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id,numericality: { other_than: 0 }
    validates :phone_number,format: {with: /\A\d{10,11}\z/} 
    validates :city
    validates :address_line1
    validates :token
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,address_line1: address_line1,address_line2: address_line2,phone_number: phone_number, order_id: order.id)
  end
end