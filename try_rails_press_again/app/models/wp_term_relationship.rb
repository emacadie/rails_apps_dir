class WpTermRelationship < ActiveRecord::Base
  attr_accessible :object_id, :term_order, :term_taxonomy_id
end
