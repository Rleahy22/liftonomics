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

ActiveRecord::Schema.define(version: 20140305224451) do

  create_table "days", force: true do |t|
    t.integer  "week_id"
    t.integer  "day_number"
    t.date     "date_completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "days", ["week_id", "created_at"], name: "index_days_on_week_id_and_created_at"

  create_table "lifts", force: true do |t|
    t.string   "name"
    t.string   "upper_lower"
    t.string   "primary_muscle"
    t.string   "secondary_muscle"
    t.string   "push_pull"
    t.string   "instructions_one"
    t.string   "instructions_two"
    t.string   "instructions_three"
    t.string   "instructions_four"
    t.string   "instructions_five"
    t.string   "instructions_six"
    t.string   "instructions_seven"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "height_feet"
    t.integer  "height_inches"
    t.integer  "weight"
    t.integer  "max_bench"
    t.integer  "max_squat"
    t.integer  "max_deadlift"
    t.string   "level"
    t.string   "goal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

  create_table "weeks", force: true do |t|
    t.integer  "workout_id"
    t.integer  "week_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "weeks", ["workout_id", "created_at"], name: "index_weeks_on_workout_id_and_created_at"

  create_table "workouts", force: true do |t|
    t.string   "name"
    t.integer  "number_weeks"
    t.integer  "user_id"
    t.decimal  "one_month_gain"
    t.decimal  "three_month_gain"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "workouts", ["user_id", "created_at"], name: "index_workouts_on_user_id_and_created_at"

end
