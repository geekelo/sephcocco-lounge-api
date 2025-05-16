# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_05_07_114603) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sephcocco_lounge_product_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sephcocco_lounge_product_categories_on_name", unique: true
    t.index ["slug"], name: "index_sephcocco_lounge_product_categories_on_slug", unique: true
  end

  create_table "sephcocco_lounge_products", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.string "image_url"
    t.decimal "price", precision: 16, scale: 2, default: "0.0", null: false
    t.integer "amount_in_stock", default: 0, null: false
    t.string "short_description"
    t.text "long_description"
    t.string "other_images", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sephcocco_lounge_products_on_name", unique: true
  end

  create_table "sephcocco_user_roles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sephcocco_user_roles_on_name", unique: true
  end

  create_table "sephcocco_users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.text "address"
    t.string "phone_number"
    t.string "whatsapp_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "sephcocco_user_role_id", null: false
    t.index ["email"], name: "index_sephcocco_users_on_email", unique: true
    t.index ["sephcocco_user_role_id"], name: "index_sephcocco_users_on_sephcocco_user_role_id"
  end

  add_foreign_key "sephcocco_users", "sephcocco_user_roles"
end
