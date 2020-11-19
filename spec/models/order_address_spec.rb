require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it"配送先の情報として、郵便番号が必須であること" do
      @order_address.postal_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it"配送先の情報として、都道府県が必須であること" do
      @order_address.todoufuken_address_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Todoufuken address can't be blank" )
    end
    it"配送先の情報として、市区町村が必須であること" do
      @order_address.shityouson_address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shityouson address can't be blank")
    end
    it"配送先の情報として、番地が必須であること" do
      @order_address.banchi_address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Banchi address can't be blank")
    end
    it"配送先の情報として、電話番号が必須であること" do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it"郵便番号にはハイフンが必要であること（123-4567となる）" do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it"電話番号にはハイフンは不要であること" do
      @order_address.phone_number = "11-222-3333"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
    end
    it"電話番号にはハイフンは不要であること。11桁以内であること（09012345678となる）" do
      @order_address.phone_number = "111222333444"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid.")
    end
  end
end
