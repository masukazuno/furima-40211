class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります。'}
  validates :nickname, :last_name, :first_name, :ruby_last_name, :ruby_first_name, :birthday, presence: true
  validates :last_name, :first_name, presence: true , format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :ruby_last_name, :ruby_first_name, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/ }
  
end 