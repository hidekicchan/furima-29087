<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| reading_family     | string | null: false |
| reading_first      | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## items テーブル

| Column           | Type       | Option                         |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| status_id        | integer    | null: false                    |
| shipping_fee_id  | integer    | null: false                    |
| prefecture_id    | integer    | null: false                    |
| shipping_date_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_date
- has_one_attached :image

## orders テーブル

| Column      | Type       | Options           |
|-------------|----------- |------------------ |
| item(FK)    | references | foreign_key: true |
| user(FK)    | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## comments テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| content | text       |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column          | Type       | Option                         |
| --------------- | ---------- | ------------------------------ |
| postal_code     | string     | null: false                    |
| prefecture_id   | integer    | null: false                    |
| city            | string     | null: false                    |
| house_number    | string     | null: false                    |
| building_name   | string     |                                |
| tel_number      | string     | null: false                    |
| order           | references | null: false, foreign_key: true |

### Association

- belongs_to_active_hash :prefecture
- belongs_to :order
