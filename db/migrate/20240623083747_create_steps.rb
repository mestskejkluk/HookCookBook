class CreateSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :steps do |t|
      t.string :name
      t.text :description
      t.integer :time
      t.boolean :timer
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
