class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :starter_recipe
      t.string :name
      t.string :description
      t.string :image_url
      t.integer :serving_size
      t.integer :calorie_count

      t.timestamps
    end
  end
end
