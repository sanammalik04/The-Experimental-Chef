class AddSavedToUserRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_recipes, :saved, :boolean, default: false
  end
end
