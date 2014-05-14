# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER LOGIN'
# user = User.create! :name => 'user120120902', :email => 'user-2012-09-02-002@example.com', :password => 'please', :password_confirmation => 'please'
user = User.create! :name => 'user1', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
# user2 = User.create! :name => 'user220120902', :email => 'user2-2012-09-02-002@example.com', :password => 'please', :password_confirmation => 'please'
user2 = User.create! :name => 'user2', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user2.name
