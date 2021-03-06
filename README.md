## usersテーブル

|Column            |Type       |Options    |
|---------------   |-----------|-----------|
|nickname          |string     |null: false|
|email             |string     |null: false, unique:true|
|encrypted_password|string     |null: false|
|first_name        |string     |null: false|
|last_name         |string     |null: false|
|first_name_kana   |string     |null: false|
|last_name_kana    |string     |null: false|
|birth             |date       |null: false|

### Association
- has_many :items
- has_many :orders


## itemsテーブル

|Column         |Type       |Options    |
|---------------|-----------|-----------|
|name           |string     |null: false|
|category_id    |integer    |null: false|
|condition_id   |integer    |null: false|
|explain        |text       |null: false|
|fee_id         |integer    |null: false|
|prefecture_id  |integer    |null: false|
|delivery_id        |integer    |null: false|
|price          |integer     |null: false|
|user           |references |foreign_key: true|

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

|Column         |Type       |Options    |
|---------------|-----------|-----------|
|user           |references |foreign_key: true|
|item           |references |foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル

|Column         |Type       |Options    |
|---------------|-----------|-----------|
|postal_code    |string     |null: false|
|prefecture_id  |integer    |null: false|
|city           |string     |null: false|
|address_line1  |string     |null: false|
|address_line2  |string     |           |
|phone_number   |string     |null: false|
|order          |references |foreign_key: true|

### Association
- belongs_to :order