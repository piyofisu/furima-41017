# テーブル設計

## usersテーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| last_name           | string | null: false 全角|
| first_name          | string | null: false 全角|
| last_name_katakana  | string | null: false 全角|
| first_name_katakana | string | null: false 全角|
| birth_day           | date   | null: false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column            | Type      | Options     |
| ----------------- | --------- | ----------- |
| name              | string    | null: false |
| description       | text      | null: false |
| category_id       | integer   | null: false |
| condition_id      | integer   | null: false |
| charge_id         | integer   | null: false |
| ship_from_id      | integer   | null: false |
| until_shipping_id | integer   | null: false |
| price             | integer   | null: false |
| user              | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchasesテーブル

| Column | Type       | Options     |
|------- |----------- |------------ |
| item   | references | null: false, foreign_key: true|
| user   | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

| Column         | Type      | Options     |
| -------------- | --------- | ----------- |
| post           | string    | null: false |
| ship_from_id   | integer   | null: false |
| municipalities | string    | null: false |
| street_address | string    | null: false |
| building_name  | string    |             |
| phone_number   | string    | null: false |
| purchase       | references | null: false, foreign_key: true|

### Association

- belongs_to :purchase