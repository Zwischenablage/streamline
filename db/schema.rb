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

ActiveRecord::Schema.define(version: 2019_01_02_145755) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "oems", force: :cascade do |t|
    t.string "name"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_oems_on_project_id"
  end

  create_table "param_sets", force: :cascade do |t|
    t.string "productName"
    t.string "productVersion"
    t.string "mode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "oracleID"
    t.datetime "created_at", null: false
    t.integer "customer_id"
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_projects_on_customer_id"
  end

  create_table "session_types", force: :cascade do |t|
    t.string "type"
    t.integer "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_session_types_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "finished_at"
    t.string "vehicle"
    t.integer "state"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_sessions_on_project_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.integer "session_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_users_on_session_id"
  end

  create_table "value_set_maps", force: :cascade do |t|
    t.integer "param_set_id"
    t.integer "value_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["param_set_id"], name: "index_value_set_maps_on_param_set_id"
    t.index ["value_set_id"], name: "index_value_set_maps_on_value_set_id"
  end

  create_table "value_sets", force: :cascade do |t|
    t.string "name"
    t.string "shortComment"
    t.string "comment"
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
