class PreparationDay < ActiveHash::Base

  include ActiveHash::Associations
   has_many :items

   self.data = [
    { id: 1, preparation_day: '---' },
    { id: 2, preparation_day: '1~2日で発送' },
    { id: 3, preparation_day: '2~3日で発送' },
    { id: 4, preparation_day: '4~7日で発送' }
  ]
  include ActiveHash::Associations
  has_many :items
end