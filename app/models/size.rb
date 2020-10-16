class Size < ApplicationRecord
  has_many :items
  has_ancestry
  has_many :categories_sizes
  has_many :categories, through: :categories_sizes
end
