class PostagePayer < ActiveHash::Base

   self.data = [
    { id: 1, postage_payer: '---' },
    { id: 2, postage_payer: '着払い（購入者負担）' },
    { id: 3, postage_payer: '送料込み（出品者負担）' }
  ]
  include ActiveHash::Associations
  belongs_to :user
  has_many :items
end