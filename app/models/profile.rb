class Profile < ApplicationRecord
belongs_to :user, inverse_of: :profile
validates :first_name, presence: true
validates :family_name, presence: true
validates :first_name_kana, presence: true
validates :family_name_kana, presence: true
end
