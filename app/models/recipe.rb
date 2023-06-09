class Recipe < ApplicationRecord
  # Association
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  # Validation
  # Ensure the 'public' attribute is boolean
  validates :public, inclusion: { in: [true, false] }

  # Toggle between public and public recipe
  def toggle_public
    update(public: !public)
  end
end
