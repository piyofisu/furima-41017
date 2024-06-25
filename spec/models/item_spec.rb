require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の保存ができる場合' do
      it 'name、description、category_id、condition_id、
          charge_id、prefecture_id、until_shipping_id、price' do
        expect(@item).to be_valid
      end
    end
    context '商品の出品ができない場合' do
      it 'イメージが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空では保存できない' do
        @item.description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーの情報が選ばれていないと保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category cant't be blank")
      end
      it '商品の状態の情報が選ばれていないと保存できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition cant't be blank")
      end
      it '配送料の負担の情報が選ばれていないと保存できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge cant't be blank")
      end
      it '発送元の地域の情報が選ばれていないと保存できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture cant't be blank")
      end
      it '発送までの日数の情報が選ばれていないと保存できない' do
        @item.until_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Until shipping cant't be blank")
      end
      it '価格が空では保存できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it '価格が全角数値では保存できない' do
        @item.price = "５０００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
    end
  end
end
