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

ActiveRecord::Schema.define(version: 20151116193500) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "cep"
    t.string   "complement"
    t.string   "state"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "causes_ngos", force: :cascade do |t|
    t.integer "ngo_id"
    t.integer "cause_id"
  end

  create_table "ngos", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "address_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "address_id"
    t.date     "start_date"
    t.date     "finish_date"
    t.integer  "ngo_id"
    t.integer  "cause_id"
    t.integer  "vacancies"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "opportunities_skills", force: :cascade do |t|
    t.integer "opportunity_id"
    t.integer "skill_id"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "phone_number"
    t.integer  "ngo_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
