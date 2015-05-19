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

ActiveRecord::Schema.define(version: 20150519013900) do

  create_table "answers", force: :cascade do |t|
    t.text     "textAnswer"
    t.integer  "intAnswer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "response_id"
    t.integer  "question_id"
  end

  add_index "answers", ["question_id"], name: "index_answers_on_question_id"
  add_index "answers", ["response_id"], name: "index_answers_on_response_id"

  create_table "questions", force: :cascade do |t|
    t.text     "question"
    t.integer  "questiontype"
    t.integer  "family"
    t.integer  "version"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "questionships", force: :cascade do |t|
    t.integer  "quiz_id"
    t.integer  "question_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questionships", ["question_id"], name: "index_questionships_on_question_id"
  add_index "questionships", ["quiz_id"], name: "index_questionships_on_quiz_id"

  create_table "quizzes", force: :cascade do |t|
    t.integer  "version"
    t.integer  "family"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quiz_id"
    t.integer  "user_id"
  end

  add_index "responses", ["quiz_id"], name: "index_responses_on_quiz_id"
  add_index "responses", ["user_id"], name: "index_responses_on_user_id"

  create_table "users", force: :cascade do |t|
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
    t.integer  "quiz_id"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["quiz_id"], name: "index_users_on_quiz_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
