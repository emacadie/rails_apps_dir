class WpComment < ActiveRecord::Base
  attr_accessible :comment_ID, :comment_agent, :comment_approved, :comment_author, :comment_author_IP, :comment_author_email, :comment_author_url, :comment_content, :comment_date, :comment_date_gmt, :comment_karma, :comment_parent, :comment_post_ID, :comment_type, :user_id
end
