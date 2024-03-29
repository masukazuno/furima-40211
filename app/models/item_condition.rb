class ItemCondition < ActiveHash::Base

  include ActiveHash::Associations
  has_many :items

   self.data = [
    { id: 1, item_condition: '---' },
    { id: 2, item_condition: '新品・未使用' },
    { id: 3, item_condition: '未使用に近い' },
    { id: 4, item_condition: '目立った傷や汚れなし' },
    { id: 5, item_condition: 'やや傷や汚れあり' },
    { id: 6, item_condition: '傷や汚れあり' },
    { id: 7, item_condition: '全体的に状態が悪い' }
  ]
end