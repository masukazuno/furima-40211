class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation

  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :category_id, presence: true
  validates :item_condition_id, presence: true
  validates :postage_payer_id, presence: true
  validates :prefecture_code_id, presence: true
  validates :preparation_day_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true }
             
  with_options numericality: { other_than: 1 }do
  
validates :category_id
validates :item_condition_id
validates :postage_payer_id
validates :prefecture_code_id
validates :preparation_day_id

validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}


end
end
