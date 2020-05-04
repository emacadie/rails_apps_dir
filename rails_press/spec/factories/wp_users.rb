# Read about factories at https://github.com/thoughtbot/factory_girl
=begin
- !ruby/object:WpUser
  attributes:
    ID: 1
    
- !ruby/object:WpUser
  attributes:
    ID: 2
    user_login: author
    user_pass: $P$BpHLIUI2NpCvZr3PvqNJG56QZ10WL1.
    user_nicename: author
    user_email: author@author.com
    user_url: ''
    user_registered: 2013-01-29 21:52:13.000000000 Z
    user_activation_key: ''
    user_status: 0
    display_name: Author Name
 => nil 
=end


FactoryGirl.define do
  factory :wp_user do
    user_login "admin"
    user_pass "$P$BRSZnbS5PzeCL3olwpQbbX0WQqw2ew"
    user_nicename "admin"
    user_email "ff@ff.com"
    user_url ""
    user_registered "2013-01-28 06:42:31.000000000 Z"
    user_activation_key ''
    user_status 0
    display_name "admin"
  end


  factory :wp_user2, class: WpUser do
    provider "twitter"
    uid "12346"
    name "Jimmy 2"
    id 2
    number_of_sites 0
  end

  factory :user_create, class: WpUser do
    provider "twitter"
    uid "12346"
    name "Jimmy 2"
    
    number_of_sites 0
  end

end
