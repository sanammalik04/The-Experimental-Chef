class CreateUserRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_recipes do |t|
      t.integer :user_id
      t.string :recipe_id

      t.timestamps
    end
  end
end
