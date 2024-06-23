class RenameOldColumnToNewColumn < ActiveRecord::Migration[7.2]
  def change
    rename_column :recipes, :description, :description
    rename_column :steps, :description, :description
    rename_column :ingredients, :description, :description
  end
end
