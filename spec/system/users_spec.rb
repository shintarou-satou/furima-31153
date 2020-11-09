require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
    before do
      @user = FactoryBot.build(:user)
    end
  context "ログインしている時" do
    it"トップページに移動する"do
      visit root_path
    end
    it "ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること" do
    
      expect(page).to have_content('新規登録')  
      expect(page).to have_content('ログイン') 
    end   
    it "ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること" do
      find_link('新規登録', href: new_user_registration_path).click
      find_link('ログイン', href: new_user_session_path).click
    end
    it"ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること"do
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in "ニックネーム", with: @user.nickname
      fill_in "メールアドレス", with: @user.email
      fill_in "パスワード", with: @user.password
      fill_in "パスワード（確認）", @user.password_confirmation
      fill_in "お名前（全角）", with: @user.firstname
      fill_in "お名前（全角）", with: @user.lastname
      fill_in "お名前カナ（全角）", with: @user.firstname_kana
      fill_in "お名前カナ（全角）", with: @user.lastname_kana
      fill_in "生年月日", with: @user.birthday
      # 会員登録ボタンを押すとユーザーカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ移動したことを確認する
      expect(current_path).to eq root_path
      # ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('ログイン')
    end
    it "ヘッダーのログアウトボタンをクリックすることで、ログアウトができること" do
      expect{
        find_link('ログアウト', href: root_path).click
      }.to change { User.count }.by(-1)
    end 
  end

  
     
    
  

end