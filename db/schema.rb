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

ActiveRecord::Schema.define(version: 20150926111107) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: true do |t|
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
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "commentable_type"
    t.integer  "commentable_id"
    t.integer  "post_id"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "price",      precision: 10, scale: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id", using: :btree

  create_table "objectives", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "type"
    t.integer  "phase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "objectives", ["phase_id"], name: "index_objectives_on_phase_id", using: :btree

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "checked_out_at"
    t.decimal  "total_price",    precision: 8, scale: 2, default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["checked_out_at"], name: "index_orders_on_checked_out_at", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payments", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone"
    t.string   "fax"
    t.string   "email"
    t.text     "response"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phases", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phases", ["plan_id"], name: "index_phases_on_plan_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "photo_holder_id",                null: false
    t.string   "photo_holder_type",   limit: 20, null: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "photos", ["photo_holder_id", "photo_holder_type"], name: "index_photos_on_photo_holder_id_and_photo_holder_type", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plans", ["team_id"], name: "index_plans_on_team_id", using: :btree

  create_table "posts", force: true do |t|
    t.text     "title"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "postable_type"
    t.integer  "postable_id"
    t.integer  "objective_id"
  end

  add_index "posts", ["objective_id"], name: "index_posts_on_objective_id", using: :btree
  add_index "posts", ["postable_type", "postable_id"], name: "index_posts_on_postable_type_and_postable_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "author"
    t.decimal  "price",               precision: 10, scale: 0
    t.boolean  "featured"
    t.date     "available_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "products", ["available_on"], name: "index_products_on_available_on", using: :btree
  add_index "products", ["featured"], name: "index_products_on_featured", using: :btree

  create_table "shippings", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.integer  "payment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shippings", ["payment_id"], name: "index_shippings_on_payment_id", using: :btree

  create_table "teams", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "team_id"
    t.integer  "user_id"
    t.string   "status",       default: "pending"
    t.integer  "objective_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["objective_id"], name: "index_tickets_on_objective_id", using: :btree
  add_index "tickets", ["team_id"], name: "index_tickets_on_team_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "last_name"
    t.string   "name"
    t.datetime "dob"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "gender"
    t.boolean  "terms_of_service"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
