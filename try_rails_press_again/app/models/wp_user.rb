class WpUser < ActiveRecord::Base
  attr_accessible :ID, :display_name, :user_activation_key, :user_email, :user_login, :user_nicename, :user_pass, :user_registered, :user_status, :user_url
  validates_presence_of :user_login, :user_pass, :user_nicename, :user_email, :user_url, :user_registered, :user_activation_key, :user_status, :display_name
end
