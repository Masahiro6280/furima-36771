require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    # user = FactoryBot.create(:user)
    # item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order)
    #  user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it "配送先情報とtokenがあれば保存ができること" do
      binding.pry
      expect(@order).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end