# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_17_234258) do

  create_table "recipes", force: :cascade do |t|
    t.integer "starter_recipe_id"
    t.string "name"
    t.string "description"
    t.string "image_url"
    t.integer "serving_size"
    t.integer "calorie_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "instructions"
    t.boolean "is_starter?"
    t.string "chef_name"
    t.integer "user_id"
    t.string "ingredients"
    t.index ["starter_recipe_id"], name: "index_recipes_on_starter_recipe_id"
  end

  create_table "recipes_tags", force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.boolean "cuisine?"
    t.boolean "dietary?"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_recipes", force: :cascade do |t|
    t.integer "user_id"
    t.string "recipe_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "review"
    t.integer "rating"
    t.boolean "on_grocery_list", default: false
    t.boolean "saved", default: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "name"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
