require 'rails_helper'
RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end

  describe 'ユーザー新規登録' do
     context'ユーザー新規登録ができる時'do
      it"必須項目が全てあれば保存される"do
       expect(@user).to be_valid
       end
     end


     context'ユーザー新規登録ができない時'do
      it "ニックネームが必須であること" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "メールアドレスが必須であること" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end  
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end  
      it "メールアドレスは、@を含む必要があること" do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end  
      it "パスワードが必須であること" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end  
      it "パスワードは、6文字以上での入力が必須であること" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end  
      it "パスワードは、英字のみでは登録できないこと" do
        @user.password ="aaaaaa" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end  
      it "パスワードは、数字のみでは登録できないこと" do
        @user.password ="111111" 
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end  
      it "パスワードは、確認用を含めて2回入力すること" do
        @user.password = "kk11qq11"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end  
      it "パスワードとパスワード（確認用）、値の一致が必須であること" do
        @user.password = "1111aaaa"
        @user.password_confirmation = "2222bbbb"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end  
      it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
        @user.lastname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end  
      it "ユーザー本名は、名字と名前がそれぞれ必須であること" do
        @user.firstname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.lastname = "SATO"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname 全角（漢字・ひらがな・カタカナ）文字を使用してください")
      end  
      it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
        @user.firstname = "shintarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname 全角（漢字・ひらがな・カタカナ）文字を使用してください")
      end  

      it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
        @user.lastname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana can't be blank")
      end  

      it "ユーザー本名のフリガナは、名字と名前でそれぞれ必須であること" do
        @user.firstname_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana can't be blank")
      end  
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.lastname_kana = "さとう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname kana 全角カナ文字を使用してください")
      end  
      it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
        @user.firstname_kana = "しんたろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname kana 全角カナ文字を使用してください")
      end  
      it "生年月日が必須であること" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end  
 
 end
end
end
  