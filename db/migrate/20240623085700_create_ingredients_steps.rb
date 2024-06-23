class CreateIngredientsSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients_steps do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :step, null: false, foreign_key: true

      t.timestamps
    end
  end
end
