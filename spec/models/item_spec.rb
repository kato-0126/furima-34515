require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context "商品が出品できる場合" do
      it "画像、名前、説明、カテゴリ、商品状態、配送料、都道府県、配送日があれば、商品が出品できる" do
        expect(@item).to be_valid
      end
    end
  end
end