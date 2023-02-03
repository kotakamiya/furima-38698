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
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'kotamail'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
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
      end

      it 'passwordが全角のときに登録できないこと' do
        @user.password = 'ｋｏｔａ１２３４'
        @user.password_confirmation = 'ｋｏｔａ１２３４'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end

      it '姓（全角）が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it '姓（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'カﾐﾔ'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
      end

      it '名（全角）が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it '名（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'コｳﾀ'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
      end

      it '姓（カナ）が空だと登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana can't be blank"
      end

      it '姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_kana = 'あ亜1a/'
        @user.valid?
        expect(@user.errors.full_messages).to include "First kana 全角カタカナを使用してください"
      end

      it '名（カナ）が空だと登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana can't be blank"
      end

      it '名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_kana = 'い伊2b?'
        @user.valid?
        expect(@user.errors.full_messages).to include "Last kana 全角カタカナを使用してください"
      end

      it '誕生日が空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth day can't be blank"
      end
    end
  end  
end
