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

ActiveRecord::Schema.define(version: 20161204052605) do

  create_table "activities", force: :cascade do |t|
    t.integer  "process_report_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "activities", ["process_report_id"], name: "index_activities_on_process_report_id"

  create_table "disk_reports", force: :cascade do |t|
    t.integer  "total"
    t.integer  "used"
    t.integer  "server_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "disk_reports", ["server_id"], name: "index_disk_reports_on_server_id"

  create_table "process_reports", force: :cascade do |t|
    t.integer  "server_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "process_reports", ["server_id"], name: "index_process_reports_on_server_id"

  create_table "ram_reports", force: :cascade do |t|
    t.integer  "total"
    t.integer  "used"
    t.integer  "server_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ram_reports", ["server_id"], name: "index_ram_reports_on_server_id"

  create_table "servers", force: :cascade do |t|
    t.string   "name"
    t.integer  "status"
    t.datetime "last_connection"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "servers", ["user_id"], name: "index_servers_on_user_id"

  create_table "session_tokens", force: :cascade do |t|
    t.string   "token"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "expires_at"
  end

  add_index "session_tokens", ["user_id"], name: "index_session_tokens_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
