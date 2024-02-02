# README

users table
|nickname|	string|null:false|
|email|string|null: false, uniqueness: true|
|password	|string	|null: false, uniqueness: true|
|last_name|	string|	null: false|
|first_name|	string,|null: false|
|ruby_last_name	|string	|null:false|
|ruby_first_name|string	|null:false|

Association
has_many :products
has_one :credit_card
has_one :ship_address


itemsテーブル
|name|	string|	null:false|
|introduction|	text|	null:false|
|price|	integer	|null:false|
|item_condition	|integer|	null:false,foreign_key:true|
|postage_payer|	integer	|null:false,foreign_key: true|
|prefecture_code|	integer	|null:false|
|preparation_day|	integer|	null:false,foreign_key: true|
|category	|references|	null:false,foreign_key:true|
|seller|	references	|null:false,foreign_key:true|
|buyer|	references	|foreign_key:true|

Association
has_many :item_imgs, dependent: :destroy
belongs_to :category
belongs_to :user


item_imgsテーブル
|url|	string|	null:false|
|item	|references	| null:false,foreign_key:true|

Association
belongs_to :item


credit_cardsテーブル
|user_id	|integer|	null:false|
|customer_id|	string	null:false|
|card_id	string	|null:false|

Association
belongs_to: user

categoriesテーブル
|name	|string|	null:false|
|ancestry	|string	|null:false|

Association
has_many :items


sending_destinationsテーブル
|destination_first_name|	string	|null:false|
|destination_family_name|	string|	null:false|
|destination_first_name_kana	|string	|null: false|
|destination_family_name_kana	|string	|null: false|
|post_code	integer(7)	|null:false|
|prefecture_code	|integer	|null:false|
|city	|string|	null:false|
|house_number	|string	|null:false|
|building_name	|string	|
|phone_number|	integer|	unique:true|
|user	references|	null: false,foreign_key:true|

Association
belongs_to: user