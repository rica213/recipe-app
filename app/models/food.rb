class Food < ApplicationRecord
  # Association
  belongs_to :user
  has_many :recipe_foods
  has_many :recipes, through: :recipe_foods
end
