class WpTerm < ActiveRecord::Base
  attr_accessible :name, :slug, :term_group, :term_id
end
