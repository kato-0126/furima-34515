class Item < ApplicationRecord
    belongs_to :user
    has_one :order
    has_one_attached :image

  
    validates :name, presence: true, length:{ maximum:40 }
    validates :explain, presence: true, length:{ maximum:1000 }
  
    validates :price, presence: true, inclusion: { in: 300..9999999 },format: { with: /\d/ }
    validates :image, presence: true

    with_options numericality: { other_than: 0 } do
      validates :category_id  
      validates :condition_id
      validates :fee_id 
      validates :prefecture_id 
      validates :delivery_id
    end 


    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :condition
    belongs_to_active_hash :fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery
end