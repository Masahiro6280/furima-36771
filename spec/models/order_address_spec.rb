require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.2
    end

    context '正常に購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    
  end


    context '購入できない場合' do
      it '郵便番号が空だと保存できないこと' do
        @order_address.post_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number can't be blank")
      end
      
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_number = '3334444'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it '郵便番号が半角の英語を含でいると保存できないこと' do
        @order_address.post_number = '333-aaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post number is invalid. Include hyphen(-)")
      end
      it '都道府県を選択していないと保存できないこと' do
        @order_address.area_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it '都道府県を未選択していないと保存できないこと' do
        @order_address.area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Area can't be blank")
      end
      it '市町村が空だと保存できないこと' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_address.house_num = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House num can't be blank")
      end
      it '電話番号が半角英語だと保存できないこと' do
        @order_address.phone_number = 'aaaaaaaaaa'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Half-width number")
      end
      it '電話番号が10桁未満では保存できないこと' do
        @order_address.phone_number = '5555555'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10~11桁で入力してください")
      end
      it '電話番号が11桁を超えると保存できないこと' do
        @order_address.phone_number = '12345678901234'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number は10~11桁で入力してください")
      end
      it '電話番号が全角だと保存できないこと' do
        @order_address.phone_number = '９９９９９９９９９９'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number Half-width number")
      end
      it '電話番号が空だと保存できないこと' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
        it "tokenが空では登録できないこと" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end

