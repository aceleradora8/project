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

ActiveRecord::Schema.define(version: 20160112123232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.string   "zipcode"
    t.string   "complement"
    t.string   "state"
    t.string   "city"
    t.string   "country",      default: "Brasil"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "neighborhood"
    t.integer  "number"
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

  create_table "interests", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.integer  "opportunity_id"
    t.boolean  "confirmed"
    t.boolean  "presence"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "ngos", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "address_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "cnpj"
    t.boolean  "privacy"
    t.string   "phone1"
    t.string   "phone2"
    t.text     "mission"
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
    t.boolean  "recurrent"
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

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.boolean  "confirmed",              default: false
    t.string   "confirm_token"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "auth_token"
  end

  create_table "volunteers", force: :cascade do |t|
    t.string   "name"
    t.text     "observations"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "phone1"
    t.string   "phone2"
    t.integer  "user_id"
    t.string   "sex"
    t.date     "birth_date"
  end

end
