# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_07_115528) do
  create_table "accomplished_achievements", force: :cascade do |t|
    t.integer "achievement_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_accomplished_achievements_on_achievement_id"
    t.index ["game_id"], name: "index_accomplished_achievements_on_game_id"
  end

  create_table "achievements", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", precision: nil, null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "character_perks", force: :cascade do |t|
    t.integer "character_id"
    t.integer "perk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_character_perks_on_character_id"
    t.index ["perk_id"], name: "index_character_perks_on_perk_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "description"
    t.string "quote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.integer "score"
    t.integer "coin"
    t.string "time"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "jwt_blacklists", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "perks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.string "description", default: "Ich bin neu bei Freeze Together!"
    t.boolean "tos", default: false, null: false
    t.boolean "email_confirmed", default: false, null: false
    t.string "confirm_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
  end

  add_foreign_key "accomplished_achievements", "achievements"
  add_foreign_key "accomplished_achievements", "games"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "character_perks", "characters"
  add_foreign_key "character_perks", "perks"
  add_foreign_key "games", "users"
end
