class Book < ActiveRecord::Base
  attr_accessible :review, :title, :user_id
  belongs_to :user
  validates :user_id, :title, :presence => true


  def to_s
    p "Title: #{self.title} Review: #{self.review}"
  end

end
