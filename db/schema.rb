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

ActiveRecord::Schema.define(version: 20160701004827) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "due_payments", force: :cascade do |t|
    t.date     "payment_date"
    t.float    "payment_amount"
    t.float    "expected_remaining_principle"
    t.integer  "investment_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "category"
    t.index ["investment_id"], name: "index_due_payments_on_investment_id", using: :btree
  end

  create_table "investments", force: :cascade do |t|
    t.integer  "lender_id"
    t.integer  "project_id"
    t.float    "total_investment_amount"
    t.float    "outstanding_balance"
    t.integer  "loan_tenor",              default: 12
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["lender_id"], name: "index_investments_on_lender_id", using: :btree
    t.index ["project_id"], name: "index_investments_on_project_id", using: :btree
  end

  create_table "made_payments", force: :cascade do |t|
    t.date     "payment_date"
    t.float    "payment_amount"
    t.float    "actual_remaining_principle"
    t.integer  "investment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["investment_id"], name: "index_made_payments_on_investment_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "borrower_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["borrower_id"], name: "index_projects_on_borrower_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "due_payments", "investments"
  add_foreign_key "investments", "projects"
  add_foreign_key "made_payments", "investments"
end
