class WpTermTaxonomy < ActiveRecord::Base
  attr_accessible :count, :description, :parent, :taxonomy, :term_id, :term_taxonomy_id
end
