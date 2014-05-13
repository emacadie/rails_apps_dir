class Hobby
  include MongoMapper::Document

  key :name, String
  key :started, Date
  belongs_to :user

end
