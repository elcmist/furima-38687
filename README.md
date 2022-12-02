# README

## BASIC認証情報
ID: admin
PASSWORD: 2222


## usersテーブル
### Association
has_many :items
has_many :orders
| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| kana_last_name  | string | null: false |
| kana_first_name | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| birthday        | date   | null: falde |


## itemsテーブル
### Association
belongs_to :user
has_one :orders
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| explanation        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_cost_id   | integer    | null: false                    |
| delivery_origin_id | integer    | null: false                    |
| delivery_days_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |



## addresses テーブル
### Association
belongs_to :orders
| Column         | Type    | Options                        |
|--------------- | ------- | ------------------------------ |
| num            | string  | null: false                    |
| prefectures_id | integer | null: false                    |
| city           | string  | null: false                    |
| area           | string  | null: false                    |
| building       | string  |                                |
| phone          | string  | null: false                    |
| order          | integer | null: false, foreign_key: true |


## ordersテーブル
### Association
belongs_to :item
belongs_to :user
has_one :address

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |