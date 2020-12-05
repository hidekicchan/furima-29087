require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end
  describe '商品購入登録' do
    context '商品登録がうまくいく時' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@user_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品登録がうまくいかない時' do
      it '郵便番号が空だと登録できない' do
        @user_order.postal_code = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @user_order.postal_code = 1_234_567
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it '都道府県が--だと登録できない' do
        @user_order.prefecture_id = 0
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Prefecture Select')
      end
      it '市区町村が空だと登録できない' do
        @user_order.city = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと登録できない' do
        @user_order.house_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空だと登録できない' do
        @user_order.tel_number = ''
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Tel number can't be blank")
      end
      it '電話番号が12桁以上だと登録できない' do
        @user_order.tel_number = '090001111222'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Tel number is invalid')
      end
      it '電話番号にハイフンがあると登録できない' do
        @user_order.tel_number = '090-1234-5678'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Tel number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
