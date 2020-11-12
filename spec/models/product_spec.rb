require 'rails_helper'

RSpec.describe Product, type: :model do
    before do
      @product = FactoryBot.build(:product)
    end

    describe '出品商品を保存する' do
      context "出品商品が保存できる場合" do
          it"必須項目が全てあれば保存される"do
      expect(@product).to be_valid
      end
    end

      context'出品商品が保存できない時'do
        it "商品画像を1枚つけることが必須であること" do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end
        it"商品名が必須であること"do
          @product.product = ""
          @product.valid?
          expect(@product.errors.full_messages).to include("Product can't be blank")
        end
        it"商品の説明が必須であること"do
        @product.explanation = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
        end
        it"カテゴリーの情報が必須であること"do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 0")
        end
        it"商品の状態についての情報が必須であること"do
        @product.condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 0")
        end
        it"配送料の負担についての情報が必須であること"do
        @product.delivery_fee_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee must be other than 0")
        end
        it"発送元の地域についての情報が必須であること"do
        @product.todoufuken_address_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Todoufuken address must be other than 0")
        end
        it"発送までの日数についての情報が必須であること"do
        @product.shipping_time_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping time must be other than 0")
        end
        it"価格についての情報が必須であること"do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
        end
        it"価格の範囲が、¥300~¥9,999,999の間であること"do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
        it"価格の範囲が、¥300~¥9,999,999の間であること"do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
        it"販売価格は半角数字のみ保存可能であること"do
        @product.price = "aaaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
        it"販売価格は半角数字のみ保存可能であること"do
        @product.price = "１０００００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
    end
  end
end
