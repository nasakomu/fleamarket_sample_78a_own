class Profile < ApplicationRecord
belongs_to :user, inverse_of: :profile
validates :first_name, :family_name, :family_name_kana, :first_name_kana, :birth_date presence: true

validates :first_name, :family_name, :family_name_kana, :first_name_kana, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
end
