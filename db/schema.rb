# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 20160413202739) do


  create_table "affiliations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sector"
    t.string   "email"
    t.string   "phone1"
    t.boolean  "publish",    limit: 255
    t.string   "direccion"
    t.string   "extension"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "extension"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_name"
    t.integer  "column"
    t.string   "waste_type"
  end

  create_table "examples", force: true do |t|
    t.string   "name",                          null: false
    t.boolean  "enabled",        default: true, null: false
    t.integer  "subcategory_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "examples", ["subcategory_id"], name: "index_examples_on_subcategory_id"

  create_table "line_strings", force: true do |t|
    t.string   "name",                    null: false
    t.text     "coordinates", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "route_id"
  end

  add_index "line_strings", ["route_id"], name: "index_line_strings_on_route_id"

  create_table "rates", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recycling_way_images", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "recyclingWay_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recycling_way_images", ["recyclingWay_id"], name: "index_recycling_way_images_on_recyclingWay_id"

  create_table "recycling_ways", force: true do |t|
    t.string   "title"
    t.text     "description",    limit: 255
    t.integer  "subcategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_name"
  end

  add_index "recycling_ways", ["subcategory_id"], name: "index_recycling_ways_on_subcategory_id"

  create_table "routes", force: true do |t|
    t.string   "name",            null: false
    t.string   "schedule",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "waste_picker_id"
    t.string   "color",           null: false
  end

  add_index "routes", ["waste_picker_id"], name: "index_routes_on_waste_picker_id"

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.text     "description",  limit: 255
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_name"
    t.text     "examples"
    t.text     "instructions"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "waste_pickers", force: true do |t|
    t.string   "name",           null: false
    t.date     "birth_date"
    t.date     "start_date"
    t.text     "background"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "affiliation_id"
  end

  add_index "waste_pickers", ["affiliation_id"], name: "index_waste_pickers_on_affiliation_id"

end
