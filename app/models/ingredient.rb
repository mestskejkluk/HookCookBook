class Ingredient < ApplicationRecord
  has_many :ingredients_steps
  has_many :steps, through: :ingredients_steps
end
