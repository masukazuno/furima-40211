# README

## users table
|Column|Type|Options|
|nickname|	string|null:false|
|email|string|null: false, uniqueness: true|
|encrypted_password	|string	|null: false, default|
|last_name|	string|	null: false|
|first_name|	string,|null: false|
|ruby_last_name	|string	|null:false|
|ruby_first_name|string	|null:false|
|birthday |date	|null:false|

### Association
has_many :products
has_one :ship_address


## itemsテーブル
|Column|Type|Options|
|name|	string|	null:false|
|introduction|	text|	null:false|
|price|	integer	|null:false|
|item_condition_id	|integer|	null:false,foreign_key:true|
|postage_payer_id|	integer	|null:false,foreign_key: true|
|prefecture_code_id|	integer	|null:false|
|preparation_day_id|	integer|	null:false,foreign_key: true|
|category_id	|references|	null:false,foreign_key:true|
|seller	|references	| null:false,foreign_key:true | 

### Association
belongs_to :category
belongs_to :user


## categoriesテーブル
|Column|Type|Options|
|name	|string|	null:false|
|ancestry	|string	|null:false|

### Association
has_many :items


## sending_destinationsテーブル
|Column|Type|Options|

|post_code	| string	|null:false|
|prefecture_code	|integer	|null:false|
|city	|string|	null:false|
|house_number	|string	|null:false|
|building_name	|string	|
|phone_number|	string |	unique:true|


### Association
belongs_to: user

## orders テーブル
|Column|Type|Options|
|user| references| null: false, foreign_key: true|
|item	|references|	null: false, foreign_key: true|


### Association
belongs_to :user
belongs_to :item