# README

## users table
|Column|Type|Options|
|nickname|	string|null:false|
|email|string|unique: true|
|encrypted_password	|string	|null: false|
|last_name|	string|	null: false|
|first_name|	string,|null: false|
|ruby_last_name	|string	|null:false|
|ruby_first_name|string	|null:false|
|birthday |date	|null:false|

### Association
has_many :items
has_one :sending_destination
has_one :orders


## itemsテーブル
|Column|Type|Options|
|name|	string|	null:false|
|introduction|	text|	null:false|
|price|	string	|null:false|
|item_condition_id	|string |	null:false|
|postage_payer_id|	string	|null:false|
|prefecture_code_id|	string	|null:false|
|preparation_day_id|	string|	null:false|
|category_id	|string|	null:false|
|user	| string	| null: false,foreign_key:true| 

### Association
belongs_to :user
has_one :orders


## sending_destinationsテーブル
|Column|Type|Options|

|post_code	| string	|null:false|
|prefecture_code	|integer	|null:false|
|city	|string|	null:false|
|house_number	|string	|null:false|
|building_name	|string	|
|phone_number|	string |	unique:true|
| order	| string	| null: false,foreign_key:true| 


### Association
has_one :orders

## orders テーブル
|Column|Type|Options|
|user| references| null: false, foreign_key: true|
|item	|references|	null: false, foreign_key: true|


### Association
belongs_to: user
belongs_to :item
belongs_to :sending_destinations