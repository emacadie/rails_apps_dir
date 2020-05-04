class WpOption < ActiveRecord::Base
  attr_accessible :autoload, :option_id, :option_name, :option_value
end
