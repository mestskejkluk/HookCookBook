class RemoveDescriptinFromIngredient < ActiveRecord::Migration[7.2]
  def change
    remove_column :ingredients, :description, :string
  end
end
