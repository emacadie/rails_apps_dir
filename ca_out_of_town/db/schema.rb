# encoding: UTF-8

ActiveRecord::Schema.define(:version => 20120319190441) do

  create_table "apartments", :force => true do |t|
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.integer  "zip"
    t.integer  "landlord_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "countries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "landlords", :force => true do |t|
    t.string   "first_name"
    t.string   "second_name"
    t.text     "note"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "phone"
    t.string   "email"
  end

  create_table "terms", :force => true do |t|
    t.string   "season"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.datetime "start_date"
    t.datetime "end_date"
  end

end
