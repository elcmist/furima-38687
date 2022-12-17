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
        expect(@item.errors.full_messages).to include("画像を入力してください")
     end

      it'商品名が空の時' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      it'商品説明が空の時' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end

      it'カテゴリーが空の時' do
        @item.category_id = 0
        @item.valid?
    
        expect(@item.errors.full_messages).to include("カテゴリーは0以外の値にしてください")
      end

      it'状態が空の時' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は0以外の値にしてください")
      end

      it'配送料の負担が空の時' do
        @item.delivery_cost_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は0以外の値にしてください")
      end

      it'発送元が空の時' do
        @item.prefecture_id = 0
        @item.valid?
 
        expect(@item.errors.full_messages).to include("発送元は0以外の値にしてください")
      end

      it'日数が空の時' do
        @item.delivery_day_id = 0
        @item.valid?

        expect(@item.errors.full_messages).to include("商品出荷の目安は0以外の値にしてください")
      end

      it'価格が入力されていない時' do
        @item.price = ''
        @item.valid?
        
        expect(@item.errors.full_messages).to include("商品の価格は一覧にありません", "商品の価格を入力してください", "商品の価格は数値で入力してください")
      end

      it'価格が300未満の時' do
        @item.price = '299'
        @item.valid?
       
        expect(@item.errors.full_messages).to include("商品の価格は一覧にありません", "商品の価格は300以上の値にしてください")
      end

      it'価格が99999999以上の時' do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の価格は一覧にありません", "商品の価格は9999999以下の値にしてください")
      end

      it'販売価格が半角英数以外入力された時' do
        @item.price = 'aaa'
        @item.valid?

        expect(@item.errors.full_messages).to include("商品の価格は一覧にありません", "商品の価格は数値で入力してください")
      end

      it'ユーザー情報がない場合は登録できないこと' do
        @item.user = nil
        @item.valid?
      
        expect(@item.errors.full_messages).to include("ユーザーを入力してください")
      end
      

    end
end
end