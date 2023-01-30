# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique:true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_kana         | string | null: false |
| last_kana          | string | null: false |
| birth_day          | date   | null: false |

### Association
- has_many :items
- has_many :orders


## orders テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true    |
| item    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## Items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item_name | string   | null: false                    |
| explain | text       | null: false                    |
| category_id | integer| null: false                    |
| state_id   | integer | null: false                    |
| shipping_id   | integer    | null: false              |
| area_id    | integer | null: false                    |
| number_of_day_id     | integer    | null: false       |
| price   | integer    | null: false                    |
| user | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| post_code | string    | null: false                    |
| area_id  | integer    | null: false                    |
| city    | string     | null: false                    |
| address | string     | null: false |
| building_name | string    | 
| phone_number | string | null: false |
| order | references    | null: false, foreign_key: true |

### Association
- belongs_to :order


