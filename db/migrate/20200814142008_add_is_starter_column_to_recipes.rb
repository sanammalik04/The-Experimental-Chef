class AddIsStarterColumnToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :is_starter?, :boolean
  end
end
