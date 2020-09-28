class Profile < ApplicationRecord
belongs_to :user, inverse_of: :profile
validates :first_name, :family_name, :family_name_kana, :first_name_kana, :birth_date, presence: true

validates :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ }
validates :first_name, :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
end
