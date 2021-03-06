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

ActiveRecord::Schema.define(version: 20140223033513) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "cards", force: true do |t|
    t.text     "front"
    t.text     "back"
    t.integer  "deck_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "line_num"
  end

  add_index "cards", ["deck_id"], name: "index_cards_on_deck_id", using: :btree

  create_table "decks", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "decks", ["user_id"], name: "index_decks_on_user_id", using: :btree

  create_table "entries", force: true do |t|
    t.string "traditional_characters"
    t.string "simplified_characters"
    t.string "pronunciation"
    t.text   "glosses"
    t.string "raw_entry"
  end

  create_table "entries_expressions", id: false, force: true do |t|
    t.integer "entry_id",      null: false
    t.integer "expression_id", null: false
  end

  create_table "expressions", force: true do |t|
    t.integer  "card_id"
    t.integer  "char_num"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "expressions", ["card_id"], name: "index_expressions_on_card_id", using: :btree

  create_table "texts", force: true do |t|
    t.string   "name"
    t.string   "episode"
    t.string   "artist"
    t.text     "raw"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deck_id"
  end

  add_index "texts", ["deck_id"], name: "index_texts_on_deck_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
