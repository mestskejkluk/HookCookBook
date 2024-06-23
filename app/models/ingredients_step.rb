class IngredientsStep < ApplicationRecord
  belongs_to :ingredient
  belongs_to :step
end
