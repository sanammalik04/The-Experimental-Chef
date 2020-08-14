class AddChefNameToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :chef_name, :string
  end
end
