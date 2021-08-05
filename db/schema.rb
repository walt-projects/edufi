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

ActiveRecord::Schema.define(version: 2021_02_19_231957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cohorts", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "school_id", null: false
    t.bigint "teacher_id"
    t.bigint "curriculum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_cohorts_on_curriculum_id"
    t.index ["school_id"], name: "index_cohorts_on_school_id"
    t.index ["teacher_id"], name: "index_cohorts_on_teacher_id"
  end

  create_table "curriculums", force: :cascade do |t|
    t.string "title", null: false
    t.text "description"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.string "school_id", null: false
    t.integer "student_id", null: false
    t.integer "cohort_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id", "cohort_id"], name: "index_enrollments_on_student_id_and_cohort_id", unique: true
  end

  create_table "schools", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_students_on_school_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_teachers_on_school_id"
  end

  add_foreign_key "cohorts", "curriculums"
  add_foreign_key "cohorts", "schools"
  add_foreign_key "cohorts", "teachers"
  add_foreign_key "students", "schools"
  add_foreign_key "teachers", "schools"
end
