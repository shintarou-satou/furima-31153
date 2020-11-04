##FrimaのER図



##usersテーブル
| Column             | Type     | Options    |
|--------------------|----------|------------|
| email              | string   | null:false |
| encrypted_password | string   | null:false |
| nickname           | string   | null:false |
| lastname           | string   | null:false |
| firstname          | string   | null:false |
| lastname_kana      | string   | null:false |
| firstname_kana     | string   | null:false |
| birthday           | date     | null:false |

##Association
-has_many :products
-has_many :boughts


##productsテーブル
| Column                | Type      |  Options                      |
|-----------------------|-----------|-------------------------------|
| product               | string    | null:false                    |
| explanation           | text      | null:false                    |
| category_id           | integer    | null:false                    |
| condition_id          | integer   | null:false                    |
| delivery_fee_id       | integer    | null:false                    |
| todoufuken_address_id | integer   | null:false                    |
| shipping_time_id      | integer   | null:false                    |
| price                 | integer   | null:false                    |
| user                  | reference | null:false, foreign_key: true |    |

##Association
-has_one :bought
-belongs_to :user


##boughtsテーブル
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| user    | reference  | null:false, foreign_key: true |
| product | reference  | null:false, foreign_key: true |

##Association
-belongs_to :user
-belongs_to :product
-has_one :address


##addressテーブル
| Column                | Type    | Options    |
|-----------------------|---------|------------|
| postal_code           | string  | null:false |
| todoufuken_address_id | integer | null:false |
| shityouson_address    | string  | null:false |
| banchi_address        | string  | null:false |
| building              | string  |            |
| phone_number          | string  | null:false |


##Association
-belongs_to :bought