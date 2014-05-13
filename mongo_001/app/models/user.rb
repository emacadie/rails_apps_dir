class User
  include MongoMapper::Document

  key :name, String
  key :age, Integer
  has_many :hobbies
  # validates_presence_of :title

end
