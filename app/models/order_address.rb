class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address_line1,:address_line2,:phone_number,:order,:user,:item

  with_options presence:true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :address_line1
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id,item_id: item_id)
    Address.create(postal_code: postal_code,prefecture_id: prefecture_id,city: city,address_line1: address_line1,address_line2: address_line2,phone_number: phone_number, order_id: order_id)
  end
end