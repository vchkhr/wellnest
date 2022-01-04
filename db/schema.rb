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

ActiveRecord::Schema.define(version: 2022_01_04_144946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
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
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "clients", force: :cascade do |t|
    t.string "image"
    t.integer "age"
    t.string "bio"
    t.bigint "user_id", null: false
    t.bigint "gender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gender_id"], name: "index_clients_on_gender_id"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "clients_problems", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "problem_id"
    t.index ["client_id"], name: "index_clients_problems_on_client_id"
    t.index ["problem_id"], name: "index_clients_problems_on_problem_id"
  end

  create_table "clients_techniques", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "technique_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_clients_techniques_on_client_id"
    t.index ["technique_id"], name: "index_clients_techniques_on_technique_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "image"
    t.integer "age"
    t.string "edu"
    t.string "work"
    t.string "licenses"
    t.string "links"
    t.bigint "user_id", null: false
    t.bigint "gender_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gender_id"], name: "index_coaches_on_gender_id"
    t.index ["user_id"], name: "index_coaches_on_user_id"
  end

  create_table "coaches_problems", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "problem_id"
    t.index ["coach_id"], name: "index_coaches_problems_on_coach_id"
    t.index ["problem_id"], name: "index_coaches_problems_on_problem_id"
  end

  create_table "completed_steps", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "step_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_completed_steps_on_client_id"
    t.index ["step_id"], name: "index_completed_steps_on_step_id"
  end

  create_table "genders", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "genders_techniques", force: :cascade do |t|
    t.bigint "technique_id"
    t.bigint "gender_id"
    t.index ["gender_id"], name: "index_genders_techniques_on_gender_id"
    t.index ["technique_id"], name: "index_genders_techniques_on_technique_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.integer "status"
    t.bigint "client_id", null: false
    t.bigint "coach_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_invitations_on_client_id"
    t.index ["coach_id"], name: "index_invitations_on_coach_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "text", null: false
    t.boolean "from_client"
    t.bigint "client_id"
    t.bigint "coach_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_messages_on_client_id"
    t.index ["coach_id"], name: "index_messages_on_coach_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "text"
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_notifications_on_client_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "name", null: false
  end

  create_table "problems_techniques", force: :cascade do |t|
    t.bigint "technique_id"
    t.bigint "problem_id"
    t.index ["problem_id"], name: "index_problems_techniques_on_problem_id"
    t.index ["technique_id"], name: "index_problems_techniques_on_technique_id"
  end

  create_table "steps", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "image"
    t.string "video_url"
    t.string "audio_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "steps_techniques", force: :cascade do |t|
    t.bigint "technique_id"
    t.bigint "step_id"
    t.index ["step_id"], name: "index_steps_techniques_on_step_id"
    t.index ["technique_id"], name: "index_steps_techniques_on_technique_id"
  end

  create_table "techniques", force: :cascade do |t|
    t.string "title", null: false
    t.string "description", null: false
    t.string "image"
    t.integer "age_start", null: false
    t.integer "age_end", null: false
    t.integer "duration_start", null: false
    t.integer "duration_end", null: false
    t.integer "likes", default: 0
    t.integer "dislikes", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "is_verified"
    t.boolean "send_email_notifications"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clients", "genders"
  add_foreign_key "clients", "users"
  add_foreign_key "clients_techniques", "clients"
  add_foreign_key "clients_techniques", "techniques"
  add_foreign_key "coaches", "genders"
  add_foreign_key "coaches", "users"
  add_foreign_key "completed_steps", "clients"
  add_foreign_key "completed_steps", "steps"
  add_foreign_key "invitations", "clients"
  add_foreign_key "invitations", "coaches"
end
