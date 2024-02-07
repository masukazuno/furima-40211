# README

## users table
|Column|Type|Options|
|nickname|	string|null:false|
|email|string|unique: true,null:false |
|encrypted_password	|string	|null: false|
|last_name|	string|	null: false|
|first_name|	string,|null: false|
|ruby_last_name	|string	|null:false|
|ruby_first_name|string	|null:false|
|birthday |date	|null:false|

### Association
has_many :items
has_many :orders


## itemsテーブル
|Column|Type|Options|
|name|	string|	null:false|
|introduction|	text|	null:false|
|price|	integer	|null:false|
|item_condition_id	|integer |	null:false|
|postage_payer_id|	integer	|null:false|
|prefecture_code_id|	integer	|null:false|
|preparation_day_id|	integer |	null:false|
|category_id	|integer|	null:false|
|user	| references	| null: false,foreign_key:true| 

### Association
belongs_to :user
has_one :order


## sending_destinationsテーブル
|Column|Type|Options|

|post_code	| string	|null:false|
|prefecture_code_id	|integer	|null:false|
|city	|string|	null:false|
|house_number	|string	|null:false|
|building_name	|string	|
|phone_number|	string |	unique:true,null:false|
| order	| references	| null: false,foreign_key:true| 


### Association
belongs_toshi :order

## orders テーブル
|Column|Type|Options|
|user| references| null: false, foreign_key: true|
|item	|references|	null: false, foreign_key: true|


### Association
belongs_to: user
belongs_to :item
has_one :sending_destination