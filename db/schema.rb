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

ActiveRecord::Schema.define(version: 2022_01_03_110629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "image_url"
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

  create_table "clients_steps", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "step_id"
    t.index ["client_id"], name: "index_clients_steps_on_client_id"
    t.index ["step_id"], name: "index_clients_steps_on_step_id"
  end

  create_table "clients_techniques", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "technique_id"
    t.index ["client_id"], name: "index_clients_techniques_on_client_id"
    t.index ["technique_id"], name: "index_clients_techniques_on_technique_id"
  end

  create_table "coaches", force: :cascade do |t|
    t.string "image_url"
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
    t.bigint "client_id"
    t.bigint "coach_id"
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
    t.string "image_url"
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
    t.string "image_url"
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

  add_foreign_key "clients", "genders"
  add_foreign_key "clients", "users"
  add_foreign_key "coaches", "genders"
  add_foreign_key "coaches", "users"
end
