require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能実装' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      order = FactoryBot.create(:order)
      @order_address = FactoryBot.build(:order_address,user_id:user.id,item_id:item.id,order_id:order.id)
    end
    
    context '商品が購入できるとき' do
      it 'すべての値が正しく入力されていれば商品購入できること' do
        expect(@order_address).to be_valid
      end
      it 'address_line2が空でも商品購入できること' do
        @order_address.address_line2 = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できないとき'do
      it 'postal_codeが空だと購入できない' do
        @order_address.postal_code =''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it 'postal_codeにハイフンが入っていないと購入できない' do
        @order_address.postal_code ='1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが未選択だと購入できない' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 0")
      end
      it 'address_line1が空だと購入できない' do
        @order_address.address_line1 =''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address line1 can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @order_address.phone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberの数字が11桁以内じゃないと購入できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @order_address.phone_number = '０９０１２３４５６７８'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが英字が入っていると購入できない' do
        @order_address.phone_number = '09O12345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'tokenが空だと購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end