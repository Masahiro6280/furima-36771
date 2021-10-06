require 'rails_helper'

  RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
   
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
        it "新規登録できる" do
          expect(@user).to be_valid
          
        end
      end
        context '新規登録できない場合' do
        it "nicknameが空では登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it "emailが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it "emailに＠がないと登録できない" do
          @user.email = 'kokokokocom'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it "passwordが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
            end
            
            it 'passwordが数字だけで6文字以上であれば登録できない' do
              @user.password = '000000'
              @user.password_confirmation = '000000'
              @user.valid?
              # binding.pry
              expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
           end

           it 'passwordとpassword_confirmationが一致しないと登録できない' do
           @user.password_confirmation ='' 
           @user.valid?
           expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end

            it "苗字が空では登録できない" do
              @user.first_name = ''
              @user.valid?
             expect(@user.errors.full_messages).to include("First name can't be blank")
          end

          it "苗字が半角では登録できない" do
            @user.first_name = 'yamada'
            @user.valid?
            expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
        end
         
            it "名前が半角では登録できない" do
              @user.last_name = 'yamada'
              @user.valid?
             expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
          end

          it "苗字（振り仮名）が半角では登録できない" do
            @user.first_name_huri = 'yamada'
            @user.valid?
           expect(@user.errors.full_messages).to include("First name huri 全角カナを使用してください")
        end

          it "名前（振り仮名）半角では登録できない" do
            @user.last_name_huri = 'yamada'
            @user.valid?
           expect(@user.errors.full_messages).to include("Last name huri 全角カナを使用してください")
        end

          
          it "名前が空では登録できない" do
            @user.last_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it "苗字（振り仮名）が空では登録できない" do
          @user.first_name_huri = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name huri can't be blank")
        end

        it "名前（振り仮名）が空では登録できない" do
          @user.last_name_huri = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name huri can't be blank")
        end

        it "誕生日が空では登録できない" do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
        
        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          # binding.pry
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
      end

   end
end

# 全ての情報が入力されていれば登録できる

# ニックネームが必須であること。
# →ニックネームがあれば登録できる（正常系）✖︎
# →ニックネームが空だったら登録できない（異常系）

# メールアドレスが必須であること。
# メールアドレスが一意性であること。
# メールアドレスは、@を含む必要があること。
# パスワードが必須であること。
# パスワードは、6文字以上での入力が必須であること
# パスワードは、半角英数字混合での入力が必須であること
# パスワードとパスワード（確認）は、値の一致が必須であること。
# お名前(全角)は、名字と名前がそれぞれ必須であること。
# お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
# お名前カナ(全角)は、名字と名前がそれぞれ必須であること。
# お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
# 生年月日が必須であること。
