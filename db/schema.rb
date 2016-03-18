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

ActiveRecord::Schema.define(version: 20160318013415) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "card_set"
    t.string   "rarity"
    t.integer  "cost"
    t.integer  "attack"
    t.integer  "health"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "card_type"
    t.string   "card_class"
  end

  add_index "cards", ["cost"], name: "index_cards_on_cost"
  add_index "cards", ["name"], name: "index_cards_on_name"

  create_table "collection_card_instances", force: :cascade do |t|
    t.integer  "collection_id"
    t.integer  "card_id"
    t.integer  "quantity",      default: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "collection_card_instances", ["card_id"], name: "index_collection_card_instances_on_card_id"
  add_index "collection_card_instances", ["collection_id"], name: "index_collection_card_instances_on_collection_id"

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dust",       default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "collections", ["user_id"], name: "index_collections_on_user_id"

  create_table "external_deck_instances", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "external_deck_id"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "external_deck_instances", ["card_id"], name: "index_external_deck_instances_on_card_id"
  add_index "external_deck_instances", ["external_deck_id"], name: "index_external_deck_instances_on_external_deck_id"

  create_table "external_decks", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "deck_class"
    t.integer  "tier"
  end

  create_table "saved_external_decks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "external_deck_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "saved_external_decks", ["external_deck_id"], name: "index_saved_external_decks_on_external_deck_id"
  add_index "saved_external_decks", ["user_id", "external_deck_id"], name: "index_saved_external_decks_on_user_id_and_external_deck_id", unique: true
  add_index "saved_external_decks", ["user_id"], name: "index_saved_external_decks_on_user_id"

  create_table "user_deck_instances", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "user_deck_id"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "user_deck_instances", ["card_id"], name: "index_user_deck_instances_on_card_id"
  add_index "user_deck_instances", ["user_deck_id"], name: "index_user_deck_instances_on_user_deck_id"

  create_table "user_decks", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_decks", ["user_id"], name: "index_user_decks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
