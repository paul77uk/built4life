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

ActiveRecord::Schema[7.0].define(version: 2023_01_17_151414) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_days_on_workout_id"
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.bigint "exercise_id", null: false
    t.string "set_number"
    t.string "weight"
    t.string "reps_dist"
    t.boolean "completed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_exercises_on_day_id"
  end

  create_table "history_days", force: :cascade do |t|
    t.bigint "day_id", null: false
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_history_days_on_day_id"
  end

  create_table "history_exercises", force: :cascade do |t|
    t.bigint "history_day_id", null: false
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["history_day_id"], name: "index_history_exercises_on_history_day_id"
  end

  create_table "history_sets", force: :cascade do |t|
    t.bigint "history_exercise_id", null: false
    t.string "exercise_set"
    t.string "weight"
    t.string "reps_dist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["history_exercise_id"], name: "index_history_sets_on_history_exercise_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "days", "workouts"
  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercises", "days"
  add_foreign_key "history_days", "days"
  add_foreign_key "history_exercises", "history_days"
  add_foreign_key "history_sets", "history_exercises"
  add_foreign_key "workouts", "users"
end
