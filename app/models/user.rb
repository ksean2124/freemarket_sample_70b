class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,presence: true
  devise :validatable, password_length: 7..128
  has_one :address
  has_one :profile
  has_many :cards
  has_many :seller_items, -> { where("buyer_id is NULL") },foreign_key: 'seller_id', class_name: 'Item'
  has_many :buyer_items, foreign_key: 'buyer_id', class_name: 'Item'
end
