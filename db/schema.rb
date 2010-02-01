# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091005171732) do

  create_table "event_attributes", :force => true do |t|
    t.integer  "event_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_participant_atts", :force => true do |t|
    t.integer  "event_participant_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_participant_availabilities", :force => true do |t|
    t.integer  "event_id",                      :null => false
    t.integer  "member_id",                     :null => false
    t.boolean  "available",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_participants", :force => true do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.integer  "partner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "team_id"
    t.string   "title",          :null => false
    t.string   "location"
    t.datetime "scheduled_date", :null => false
    t.datetime "actual_date"
    t.text     "notes"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "member_attributes", :force => true do |t|
    t.integer  "member_id"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number1"
    t.string   "phone_number2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_members", :force => true do |t|
    t.integer  "team_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "lead"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "persistence_token"
    t.integer  "login_count"
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
