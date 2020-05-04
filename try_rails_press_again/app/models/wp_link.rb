class WpLink < ActiveRecord::Base
  attr_accessible :link_description, :link_id, :link_image, :link_name, :link_notes, :link_owner, :link_rating, :link_rel, :link_rss, :link_target, :link_updated, :link_url, :link_visible
end
