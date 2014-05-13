class Laptop
  include Mongoid::Document
  field :maker, :type => String
  field :price, :type => Integer
  referenced_in :user

end
