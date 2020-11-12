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
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
        end
        it"商品の状態についての情報が必須であること"do
        @product.condition_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition is not a number")
        end
        it"配送料の負担についての情報が必須であること"do
        @product.delivery_fee_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee is not a number")
        end
        it"発送元の地域についての情報が必須であること"do
        @product.todoufuken_address_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Todoufuken address is not a number")
        end
        it"発送までの日数についての情報が必須であること"do
        @product.shipping_time_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping time is not a number")
        end
        it"価格についての情報が必須であること"do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
        end
        it"価格の範囲が、¥300~¥9,999,999の間であること"do
        @product.price = "299"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
        it"価格の範囲が、¥300~¥9,999,999の間であること"do
        @product.price = "10000000"
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


#   - ログイン状態のユーザーだけが、商品出品ページへ遷移できること
#  - ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移するこ
#  - 入力された販売価格によって、販売手数料や販売利益の表示が変わること
#  - エラーハンドリングができていること（適切では無い値が入力された場合、情報は保存されず、エラーメッセージを出力させること）
#  - 入力に問題がある状態で出品ボタンが押されたら、出品ページに戻りエラーメッセージが表示されること
  end
  end
end
