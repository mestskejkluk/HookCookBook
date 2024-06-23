class CreateIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :decription
      t.string :mesurement

      t.timestamps
    end
  end
end
