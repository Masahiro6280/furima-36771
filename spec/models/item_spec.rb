require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
   
  end

  describe '商品を出品することができない場合' do
    context '出品できる場合' do
        it "出品できる" do
          expect(@item).to be_valid
          
        end
      end  

         
      it "商品名が空では登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
          it "商品説明が空では登録できない" do
            @item.title = ''
            @item.valid?
            expect(@item.errors.full_messages).to include("Title can't be blank")
        end
        it "配送料が空では登録できない" do
          @item.delivery_fee_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "カテゴリーが空では登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "状態が空では登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "地域が空では登録できない" do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "配送期間が空では登録できない" do
        @item.period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Period can't be blank")
      end
      it "値段が空では登録できない" do
        @item.place = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Place can't be blank")
      end
      it "値段が300円未満では登録できない" do
        @item.place = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Place Out of setting range")
      end
      it "値段が10,000,000円以上では登録できない" do
        @item.place = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Place Out of setting range")
      end
      it "値段が全角では登録できない" do
        @item.place = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Place Half-width number")
      end
      it "値段が半角文字では登録できない" do
        @item.place = 'test'
        @item.valid?
        expect(@item.errors.full_messages).to include("Place Half-width number")
      end
      it "ユーザーがいなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
      it "画像がなければ出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end