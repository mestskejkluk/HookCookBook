class AddPositionToSteps < ActiveRecord::Migration[7.2]
  def change
    add_column :steps, :position, :integer
    add_index :steps, :position
  end
end
