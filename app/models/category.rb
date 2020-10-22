class Category < ApplicationRecord
  has_many :items
  has_ancestry
  has_many :categories_sizes
  has_many :sizes, through: :categories_sizes
end
