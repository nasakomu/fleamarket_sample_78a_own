class Destination < ApplicationRecord
  belongs_to :user, inverse_of: :destination
  validates :first_name, :family_name, :first_name_kana, :family_name_kana,  :postal_code, :house_number,  :phone_number, presence: true
  validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヴ]+\z/ }
  validates :postal_code, format: { with: /\A\d{7}\z/ }
  validates :phone_number, format: { with: /\A0[0-9]{9,10}\z/ }
end
