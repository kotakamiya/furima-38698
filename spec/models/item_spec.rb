require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item= FactoryBot.build(:item)
  end

  describe 'ユーザー新規登録' do

    context '商品が出品できるとき' do
      it 'image,item_name,explain,category_name,state_id,shipping_id,area_id,number_of_day_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end  

    context '商品が出品できないとき' do  
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it '説明文が空では登録できない' do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end

      it '説明文が1000文字以上では登録できない' do
        @item.explain = 'テックキャンプ'*1000
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain is too long (maximum is 1000 characters)")
      end

      it 'category_idが1では登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'state_idが1では登録できない' do
        @item.state_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it 'shipping_idが1では登録できない' do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping can't be blank")
      end

      it 'area_idが1では登録できない' do
        @item.area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      
      it 'number_of_day_idが1では登録できない' do
        @item.number_of_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Number of day can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが300円以下では登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceが9999999円以下では登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it 'priceに半角数字以外の文字（平仮名・漢字・英字・全角数字・記号）が含まれていると登録できない' do
        @item.price = 'い伊２b?'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
    end
  end
end    