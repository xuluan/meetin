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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121014222617) do

  create_table "choices", :force => true do |t|
    t.integer  "member_id",  :null => false
    t.integer  "role_id",    :null => false
    t.integer  "meeting_id", :null => false
    t.boolean  "want"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "choices", ["meeting_id"], :name => "index_choices_on_meeting_id"
  add_index "choices", ["member_id"], :name => "index_choices_on_member_id"
  add_index "choices", ["role_id"], :name => "index_choices_on_role_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "meetings", :force => true do |t|
    t.string   "title",           :null => false
    t.text     "agenda"
    t.string   "role_list"
    t.string   "invitation_list"
    t.datetime "started_at",      :null => false
    t.string   "location",        :null => false
    t.string   "intro",           :null => false
    t.integer  "organizer_id",    :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "meetings", ["organizer_id"], :name => "index_meetings_on_organizer_id"

  create_table "members", :force => true do |t|
    t.integer  "meeting_id",                   :null => false
    t.integer  "user_id",                      :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "status",     :default => true
  end

  add_index "members", ["meeting_id"], :name => "index_members_on_meeting_id"
  add_index "members", ["user_id"], :name => "index_members_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "meeting_id", :null => false
    t.integer  "assign_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["assign_id"], :name => "index_roles_on_assign_id"
  add_index "roles", ["meeting_id"], :name => "index_roles_on_meeting_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
