require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it '画像、商品名、商品説明、カテゴリー、状態、配送料の負担、発送元、日数、価格が入力されていれば登録出来る' do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it'画像が空の時' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
     end

      it'商品名が空の時' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it'商品説明が空の時' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it'カテゴリーが空の時' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it'状態が空の時' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end

      it'配送料の負担が空の時' do
        @item.delivery_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery cost must be other than 0")
      end

      it'発送元が空の時' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it'日数が空の時' do
        @item.delivery_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 0")
      end

      it'価格が入力されていない時' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it'価格が300未満の時' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it'価格が99999999以上の時' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it'販売価格が半角英数以外入力された時' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
end
end