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

ActiveRecord::Schema.define(version: 20140112053318) do

  create_table "employees", force: true do |t|
    t.string   "name"
    t.string   "netID"
    t.string   "password",              default: "watchers123"
    t.string   "password_confirmation", default: "watchers123"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "string"
    t.boolean  "exec",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "webmaster",             default: false
  end

  add_index "employees", ["netID"], name: "index_employees_on_netID", unique: true
  add_index "employees", ["remember_token"], name: "index_employees_on_remember_token"

  create_table "event_employees", force: true do |t|
    t.integer  "event_id"
    t.integer  "employee_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_employees", ["employee_id"], name: "index_event_employees_on_employee_id"
  add_index "event_employees", ["event_id", "employee_id"], name: "index_event_employees_on_event_id_and_employee_id", unique: true
  add_index "event_employees", ["event_id"], name: "index_event_employees_on_event_id"

  create_table "events", force: true do |t|
    t.string   "place"
    t.date     "date"
    t.time     "start"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["date"], name: "index_events_on_date"

  create_table "messages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_stories", force: true do |t|
    t.string   "title"
    t.string   "snippet"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "testimonials", force: true do |t|
    t.string   "content"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "netID"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
