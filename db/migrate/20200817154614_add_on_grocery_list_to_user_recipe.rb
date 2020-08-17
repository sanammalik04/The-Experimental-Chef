class AddOnGroceryListToUserRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :user_recipes, :on_grocery_list, :boolean, default: false
  end
end
