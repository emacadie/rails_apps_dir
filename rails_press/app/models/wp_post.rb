class WpPost < ActiveRecord::Base

  self.primary_key = :ID

  attr_accessible :comment_count, :comment_status, :guid, :menu_order, :ping_status, :pinged, :post_author, :post_content, :post_content_filtered, :post_date, :post_date_gmt, :post_excerpt, :post_mime_type, :post_modified, :post_modified_gmt, :post_name, :post_parent, :post_password, :post_status, :post_title, :post_type, :to_ping

end
