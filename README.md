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

| Column      | Type      | Options     |
| ----------- | --------- | ----------- |
| name        | string    | null: false |
| description | text      | null: false |
| category    | string    | null: false |
| condition   | string    | null: false |
| charge      | string    | null: false |
| ship_from   | string    | null: false |
| days        | string    | null: false |
| price       | integer   | null: false |
| user        | reference | null: false foreign_key: true |

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
| post           | integer   | null: false |
| prefectures    | string    | null: false |
| municipalities | string    | null: false |
| street_address | integer   | null: false |
| building_name  | string    |             |
| phone_number   | integer   | null: false |
| purchase       | reference | null: false, foreign_key: true|

### Association

- belongs_to :purchase