class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  has_many :items, dependent: :destroy
  has_one :profile, dependent: :destroy, inverse_of: :user
  has_one :destination, dependent: :destroy, inverse_of: :user
  accepts_nested_attributes_for :destination
  accepts_nested_attributes_for :profile
end
