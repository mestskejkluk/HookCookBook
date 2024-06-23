class AddQuantityToIngredientsStep < ActiveRecord::Migration[7.2]
  def change
    add_column :ingredients_steps, :quantity, :string
    add_column :ingredients_steps, :unit, :string
  end
end
