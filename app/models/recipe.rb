class Recipe < ApplicationRecord
  # Association
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

  # Validation
  # Ensure the 'public' attribute is boolean
  validates :public, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { greater_than: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true

  # Toggle between public and public recipe
  def toggle_public
    update(public: !public)
  end
end
