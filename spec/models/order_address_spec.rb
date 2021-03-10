require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能実装' do
    before do
      user = FactoryBot.build(:user)
      item = FactoryBot.build(:item)
      order = FactoryBot.build(:order)
      @order_address = FactoryBot.build(:order_address,user_id:user.id,item_id:item.id,order_id:order.id)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end
  end
end
