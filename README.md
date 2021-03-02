## usersテーブル

|Column         |Type       |Options    |
|---------------|-----------|-----------|
|nickname       |string     |null: false|
|email          |string     |null: false, unique:true|
|password       |string     |null: false|
|first_name     |string     |null: false|
|last_name      |string     |null: false|
|first_name_kana|string     |null: false|
|last_name_kana |string     |null: false|
|birth          |string     |null: false|
|order          |references |foreign_key: true|


### Association
- has_many :items
- has_many :orders

## itemsテーブル

|Column         |Type       |Options    |
|---------------|-----------|-----------|
|name           |string     |null: false|
|category       |string     |null: false|
|condition      |string     |null: false|
|explain        |string     |null: false|
|shipping_fee   |string     |null: false|
|shipping_from  |string     |null: false|
|shipping_date  |string     |null: false|
|price          |string     |null: false|
|commission     |string     |null: false|
|profit         |string     |null: false|
|user           |references |foreign_key: true|

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

|Column         |Type       |Options    |
|---------------|-----------|-----------|
|user           |references |foreign_key: true|
|items          |references |foreign_key: true|


### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addressテーブル

|Column         |Type       |Options    |
|---------------|-----------|-----------|
|postal_code    |integer    |null: false|
|prefecture     |string     |null: false|
|city           |string     |null: false|
|address_line1  |string     |null: false|
|address_line2  |string     |           |
|phone_number   |integer    |null: false|

### Association
- belongs_to :order