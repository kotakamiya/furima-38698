require 'rails_helper'


RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context '新規登録できるとき' do
      it 'nickname,email、password,password_confirmation,first_name,last_name,first_kana,last_kana,birth_dayが存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'passwordが6文字以上かつ半角英数字混合であれば登録できる'do
        @user.password = ''
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do

      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end


      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'kotamail'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'kota1234'
        @user.password_confirmation =  'kota1233'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'kota1'
        @user.password_confirmation = 'kota1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it 'passwordが半角数字だけのときに登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include  "Password is invalid"

      end
      
      it 'passwordが半角英字だけのときに登録できないこと' do
        @user.password = 'kotakamiya'
        @user.password_confirmation = 'kotakamiya'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"


      end

      it 'passwordが全角のときに登録できないこと' do
        @user.password = 'ｋｏｔａ１２３４'
        @user.password_confirmation = 'ｋｏｔａ１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

    end
  end  
end
