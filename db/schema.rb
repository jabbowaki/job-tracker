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

ActiveRecord::Schema.define(version: 20150104032225) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: true do |t|
    t.string   "description"
    t.integer  "opportunity_id"
    t.integer  "advocate_id"
    t.date     "meeting_date"
    t.date     "reached_out"
    t.date     "follow_up"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "advocates", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "twitter"
    t.string   "blog"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "opportunity_id"
  end

  create_table "ctos", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "twitter"
    t.string   "blog"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunities", force: true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "website"
    t.string   "career_page"
    t.text     "notes"
    t.integer  "cto_id"
    t.boolean  "applied?",    default: false
    t.boolean  "offer?",      default: false
    t.boolean  "open_job?",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
