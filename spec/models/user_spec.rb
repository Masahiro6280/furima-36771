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
               expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
           end

           it 'passwordが6文字未満であれば登録できない' do
            @user.password = 'aa000'
            @user.password_confirmation = 'aa000'
            @user.valid?
             expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
         end

         it 'passwordが英字のみであれば登録できない' do
          @user.password = 'aaaaaaa'
          @user.password_confirmation = 'aaaaaaa'
          @user.valid?
           expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
       end

        it 'passwordが全角であれば登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        
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
          
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
      end

   end
end
