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

ActiveRecord::Schema.define(version: 20151116214052) do

  create_table "affiliations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

ActiveRecord::Schema.define(version: 20151028224023) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_name"
  end

  create_table "line_strings", force: true do |t|
    t.string   "name",                    null: false
    t.text     "coordinates", limit: 255, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "route_id"
  end

  add_index "line_strings", ["route_id"], name: "index_line_strings_on_route_id"

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

  create_table "subcategories", force: true do |t|
    t.string   "name"
    t.text     "description", limit: 255
    t.string   "description"
    t.string   "string"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "waste_pickers", force: true do |t|
    t.string   "name"
    t.date     "birth_date"
    t.date     "start_date"
    t.text     "background"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
