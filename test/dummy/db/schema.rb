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

ActiveRecord::Schema[8.1].define(version: 101000510) do
  create_table "lesli_accounts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "email", null: false
    t.string "name"
    t.string "region", default: "america"
    t.string "status", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["deleted_at"], name: "index_lesli_accounts_on_deleted_at"
    t.index ["email"], name: "index_lesli_accounts_on_email", unique: true
    t.index ["user_id"], name: "index_lesli_accounts_on_user_id"
  end

  create_table "lesli_admin_account_currencies", force: :cascade do |t|
    t.integer "account_id"
    t.string "country_alpha_3"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "name"
    t.string "symbol"
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["account_id"], name: "index_lesli_admin_account_currencies_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_admin_account_currencies_on_deleted_at"
    t.index ["user_id"], name: "index_lesli_admin_account_currencies_on_user_id"
  end

  create_table "lesli_admin_account_details", force: :cascade do |t|
    t.integer "account_id"
    t.string "address"
    t.string "city"
    t.string "company_name"
    t.string "company_name_legal"
    t.string "company_tagline"
    t.integer "country"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "facebook"
    t.string "github"
    t.string "linkedin"
    t.string "phone_number_1"
    t.string "phone_number_2"
    t.string "phone_number_3"
    t.string "phone_number_4"
    t.string "postal_code"
    t.string "public_email"
    t.string "region"
    t.string "twitter"
    t.datetime "updated_at", null: false
    t.string "website"
    t.string "youtube"
    t.index ["account_id"], name: "index_lesli_admin_account_details_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_admin_account_details_on_deleted_at"
  end

  create_table "lesli_admin_account_locations", force: :cascade do |t|
    t.integer "account_id"
    t.string "calling_code"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.string "latitude"
    t.string "level"
    t.string "longitude"
    t.string "name"
    t.string "native_level"
    t.integer "parent_id"
    t.string "postal_code"
    t.string "short_name"
    t.datetime "updated_at", null: false
    t.index ["account_id", "name", "level", "parent_id"], name: "location_uniqueness_index", unique: true
    t.index ["account_id"], name: "index_lesli_admin_account_locations_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_admin_account_locations_on_deleted_at"
    t.index ["parent_id"], name: "index_lesli_admin_account_locations_on_parent_id"
  end

  create_table "lesli_admin_account_settings", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", precision: nil, null: false
    t.string "name"
    t.datetime "updated_at", precision: nil, null: false
    t.integer "user_id"
    t.string "value"
    t.index ["account_id"], name: "index_lesli_admin_account_settings_on_account_id"
    t.index ["user_id"], name: "index_lesli_admin_account_settings_on_user_id"
  end

  create_table "lesli_admin_accounts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "deleted_at", precision: nil
    t.datetime "enabled_at", precision: nil
    t.string "name"
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_admin_accounts_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_admin_accounts_on_deleted_at"
  end

  create_table "lesli_resources", force: :cascade do |t|
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.string "engine"
    t.string "identifier"
    t.string "label"
    t.integer "parent_id"
    t.string "route"
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_lesli_resources_on_deleted_at"
    t.index ["parent_id"], name: "index_lesli_resources_on_parent_id"
  end

  create_table "lesli_roles", force: :cascade do |t|
    t.integer "account_id"
    t.boolean "active"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "deleted_at"
    t.datetime "deployed_at"
    t.string "description"
    t.boolean "isolated", default: false
    t.datetime "modified_at"
    t.string "name"
    t.string "path_default"
    t.boolean "path_limited"
    t.integer "permission_level", default: 10
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_lesli_roles_on_account_id"
    t.index ["deleted_at"], name: "index_lesli_roles_on_deleted_at"
  end

  create_table "lesli_users", force: :cascade do |t|
    t.integer "account_id"
    t.boolean "active", default: true, null: false
    t.string "alias"
    t.datetime "confirmation_sent_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "current_sign_in_at"
    t.string "current_sign_in_ip"
    t.datetime "deleted_at"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "failed_attempts", default: 0, null: false
    t.string "first_name"
    t.string "last_name"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.datetime "locked_at"
    t.datetime "locked_until"
    t.datetime "password_expiration_at"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.string "salutation"
    t.integer "sign_in_count", default: 0, null: false
    t.string "telephone"
    t.datetime "telephone_confirmation_sent_at"
    t.string "telephone_confirmation_token"
    t.datetime "telephone_confirmed_at"
    t.string "title"
    t.string "uid", null: false
    t.string "unconfirmed_email"
    t.string "unlock_token"
    t.datetime "updated_at", null: false
    t.index ["account_id", "active"], name: "index_lesli_users_on_account_id_and_active"
    t.index ["account_id", "confirmed_at"], name: "index_lesli_users_on_account_id_and_confirmed_at"
    t.index ["account_id", "created_at"], name: "index_lesli_users_on_account_id_and_created_at"
    t.index ["account_id", "deleted_at"], name: "index_lesli_users_on_account_id_and_deleted_at"
    t.index ["account_id", "last_sign_in_at"], name: "index_lesli_users_on_account_id_and_last_sign_in_at"
    t.index ["account_id", "locked_at"], name: "index_lesli_users_on_account_id_and_locked_at"
    t.index ["account_id", "locked_until"], name: "index_lesli_users_on_account_id_and_locked_until"
    t.index ["account_id"], name: "index_lesli_users_on_account_id"
    t.index ["confirmation_token"], name: "index_lesli_users_on_confirmation_token", unique: true
    t.index ["deleted_at"], name: "index_lesli_users_on_deleted_at"
    t.index ["email"], name: "index_lesli_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_lesli_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_lesli_users_on_uid", unique: true
    t.index ["unlock_token"], name: "index_lesli_users_on_unlock_token", unique: true
  end

  add_foreign_key "lesli_accounts", "lesli_users", column: "user_id"
  add_foreign_key "lesli_admin_account_currencies", "lesli_admin_accounts", column: "account_id"
  add_foreign_key "lesli_admin_account_currencies", "lesli_users", column: "user_id"
  add_foreign_key "lesli_admin_account_details", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_admin_account_locations", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_admin_account_locations", "lesli_admin_account_locations", column: "parent_id"
  add_foreign_key "lesli_admin_account_settings", "lesli_admin_accounts", column: "account_id"
  add_foreign_key "lesli_admin_account_settings", "lesli_users", column: "user_id"
  add_foreign_key "lesli_admin_accounts", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_resources", "lesli_resources", column: "parent_id"
  add_foreign_key "lesli_roles", "lesli_accounts", column: "account_id"
  add_foreign_key "lesli_users", "lesli_accounts", column: "account_id"
end
