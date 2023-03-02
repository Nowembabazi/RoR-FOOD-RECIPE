class Food < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipes, through: :recipe_foods
  has_many :recipes, dependent: :destroy

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
end
