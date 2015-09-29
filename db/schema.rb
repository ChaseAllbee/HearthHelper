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

ActiveRecord::Schema.define(version: 20150929101352) do

  create_table "cards", force: :cascade do |t|
    t.string   "name"
    t.string   "card_set"
    t.string   "rarity"
    t.integer  "cost"
    t.integer  "attack"
    t.integer  "health"
    t.string   "image"
    t.string   "how_to_get"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_deck_instances", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "external_deck_id"
    t.integer  "quantity"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "external_decks", force: :cascade do |t|
    t.string   "deck_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "saved_external_decks", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "external_deck_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "user_deck_instances", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "user_deck_id"
    t.integer  "quantity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_decks", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "dust"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
