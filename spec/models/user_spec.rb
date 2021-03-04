require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

  it 'nickname,email,password,first_name(kana),last_name(kana),birthが存在すれば登録できる' do
    expect(@user).to be_valid
  end
   it 'ニックネームが空では登録できない' do

   end
   it 'emailが空では登録できない' do
   end 
  end
end
