class Destination < ApplicationRecord
  belongs_to :user, inverse_of: :destination
  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :first_name_kana, presence: true
  validates :family_name_kana, presence: true
  validates :postal_code, presence: true
  validates :first_name, presence: true
  validates :house_number, presence: true
  validates :room_number, presence: true
  validates :phone_number, presence: true
end
