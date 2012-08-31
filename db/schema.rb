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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120831223659) do

  create_table "captures", :force => true do |t|
    t.integer  "site_id"
    t.string   "screenshot"
    t.string   "page_source"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "hour_captured"
    t.integer  "captured_time"
    t.integer  "year_captured"
    t.integer  "month_captured"
    t.integer  "day_captured"
  end

  add_index "captures", ["day_captured"], :name => "index_captures_on_day_captured"
  add_index "captures", ["hour_captured"], :name => "index_captures_on_hour_captured"
  add_index "captures", ["month_captured"], :name => "index_captures_on_month_captured"
  add_index "captures", ["year_captured"], :name => "index_captures_on_year_captured"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "affiliation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end
