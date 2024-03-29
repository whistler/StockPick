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

ActiveRecord::Schema.define(:version => 20120414173948) do

  create_table "quotes", :force => true do |t|
    t.date     "date"
    t.float    "open"
    t.float    "high"
    t.float    "low"
    t.float    "close"
    t.integer  "volume"
    t.float    "adjusted_close"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "stock_id"
  end

  create_table "stocks", :force => true do |t|
    t.string   "symbol"
    t.string   "exchange"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "score"
  end

  create_table "trend_spottrs", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
