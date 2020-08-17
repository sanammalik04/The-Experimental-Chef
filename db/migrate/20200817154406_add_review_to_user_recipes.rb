class AddReviewToUserRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :user_recipes, :review, :string
    add_column :user_recipes, :rating, :integer
  end
end
