# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_30_192952) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "applications", force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "candidate_id", null: false
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["candidate_id"], name: "index_applications_on_candidate_id"
    t.index ["job_id"], name: "index_applications_on_job_id"
  end

  create_table "candidates", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
  end

  create_table "feedbacks", force: :cascade do |t|
    t.text "feedback_message"
    t.integer "application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_id"], name: "index_feedbacks_on_application_id"
  end

  create_table "headhunters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_headhunters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_headhunters_on_reset_password_token", unique: true
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "level"
    t.integer "number_of_vacancies"
    t.integer "salary"
    t.text "description"
    t.text "abilities"
    t.date "deadline"
    t.date "start_date"
    t.string "location"
    t.string "contract_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "headhunter_id"
    t.integer "status", default: 0
    t.index ["headhunter_id"], name: "index_jobs_on_headhunter_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "application_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_id"], name: "index_messages_on_application_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "candidate_id", null: false
    t.string "name"
    t.string "last_name"
    t.string "social_name"
    t.date "birthday"
    t.text "about_yourself"
    t.string "university"
    t.string "graduation_course"
    t.date "year_of_graduation"
    t.string "company"
    t.string "role"
    t.date "start_date"
    t.date "end_date"
    t.text "experience_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["candidate_id"], name: "index_profiles_on_candidate_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.date "start_date"
    t.integer "salary"
    t.text "benefits"
    t.text "bonus"
    t.text "additional_info"
    t.integer "application_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 1
    t.text "acceptance_message"
    t.text "reject_message"
    t.integer "headhunter_id"
    t.integer "candidate_id"
    t.index ["application_id"], name: "index_proposals_on_application_id"
    t.index ["candidate_id"], name: "index_proposals_on_candidate_id"
    t.index ["headhunter_id"], name: "index_proposals_on_headhunter_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "applications", "candidates"
  add_foreign_key "applications", "jobs"
  add_foreign_key "feedbacks", "applications"
  add_foreign_key "jobs", "headhunters"
  add_foreign_key "messages", "applications"
  add_foreign_key "profiles", "candidates"
  add_foreign_key "proposals", "applications"
  add_foreign_key "proposals", "candidates"
  add_foreign_key "proposals", "headhunters"
end
