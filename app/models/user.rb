class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
         
    validates :nickname, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角（漢字・ひらがな・カタカナ）文字を使用してください' } do
    
    validates :lastname
    validates :firstname
   end

  with_options presence: true, format: { with: /[ァ-ン]/, message: '全角カナ文字を使用してください' } do
    validates :lastname_kana
    validates :firstname_kana
  end

  with_options presence: true, format: { with:/\d/ } do
   validates :birthday
  end  


  has_many :products
  has_many :boughts

end
