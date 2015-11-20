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

ActiveRecord::Schema.define(version: 20151120123026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "cep"
    t.string   "complement"
    t.string   "state"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "neighbourhood"
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

  add_index "causes_ngos", ["cause_id"], name: "index_causes_ngos_on_cause_id", using: :btree
  add_index "causes_ngos", ["ngo_id"], name: "index_causes_ngos_on_ngo_id", using: :btree

  create_table "ngos", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "email",       null: false
  end

  add_index "ngos", ["address_id"], name: "index_ngos_on_address_id", using: :btree

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
    t.integer  "causes_id"
  end

  add_index "opportunities", ["address_id"], name: "index_opportunities_on_address_id", using: :btree
  add_index "opportunities", ["causes_id"], name: "index_opportunities_on_causes_id", using: :btree
  add_index "opportunities", ["ngo_id"], name: "index_opportunities_on_ngo_id", using: :btree

  create_table "opportunities_skills", force: :cascade do |t|
    t.integer "opportunity_id"
    t.integer "skill_id"
  end

  add_index "opportunities_skills", ["opportunity_id"], name: "index_opportunities_skills_on_opportunity_id", using: :btree
  add_index "opportunities_skills", ["skill_id"], name: "index_opportunities_skills_on_skill_id", using: :btree

  create_table "opportunities_volunteers", force: :cascade do |t|
    t.integer "opportunity_id"
    t.integer "volunteer_id"
  end

  add_index "opportunities_volunteers", ["opportunity_id"], name: "index_opportunities_volunteers_on_opportunity_id", using: :btree
  add_index "opportunities_volunteers", ["volunteer_id"], name: "index_opportunities_volunteers_on_volunteer_id", using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "phone_number"
    t.integer  "ngo_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "phones", ["ngo_id"], name: "index_phones_on_ngo_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "phone"
    t.text     "observations"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "causes_ngos", "causes"
  add_foreign_key "causes_ngos", "ngos"
  add_foreign_key "ngos", "addresses"
  add_foreign_key "opportunities", "addresses"
  add_foreign_key "opportunities", "causes"
  add_foreign_key "opportunities", "ngos"
  add_foreign_key "opportunities_skills", "opportunities"
  add_foreign_key "opportunities_skills", "skills"
  add_foreign_key "opportunities_volunteers", "opportunities"
  add_foreign_key "opportunities_volunteers", "volunteers"
  add_foreign_key "phones", "ngos"
end
