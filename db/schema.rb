ActiveRecord::Schema[7.0].define(version: 2023_12_22_125200) do
  enable_extension "plpgsql"

  create_table "search_records", force: :cascade do |t|
    t.string "query"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_search_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "remember_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "search_records", "users"
end
