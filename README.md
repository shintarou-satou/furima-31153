##FrimaのER図



##usersテーブル
| Column          | Type     | Options    |
|-----------------------------------------|
| email           | string   | null:false |
| password        | string   | null:false |
| nickname        | string   | null:false |
| lastname        | string   | null:false |
| firstname       | string   | null:false |
| lastname_kana   | string   | null:false |
| firstname_kana  | string   | null:false |
| birth_date      | integer  | null:false |

##Association
-has_many :products
-has_many :boughts


##productsテーブル
| Column           | Type    | Options       |
|--------------------------------------------|
| product          | string  | null:false    |
| explanation      | text    | null:false    |
| category         | string  | null:false    |
| condition_id     | integer | null:false    |
| delivery_fee_id  | string  | null:false    |
| shipping_area_id | string  | null:false    |
| shipping_time    | integer | null:false    |
| price            | integer | null:false    |

##Association
-has_one :bought
-belongs_to :user


##boughtsテーブル
| Column          | Type     | Options     |
|------------------------------------------|
| user_id         | integer  | null:false  |
| product_id      | integer  | null:false  |

##Association
-belongs_to :user
-belongs_to :product
-has_one :address


##addressテーブル
| Column                | Type    | Options    |
|----------------------------------------------|
| postal_code           | integer | null:false |
| todoufuken_address_id | integer | null:false |
| shityouson_address    | string  | null:false |
| banchi_address        | string  | null:false |
| building              | string  | null       |
| phone_number          | integer | null       |


##Association
-belongs_to :bought