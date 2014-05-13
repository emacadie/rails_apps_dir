class Website < ActiveRecord::Base

  VALID_VALUES = [0, 1, 2, 3, 4, 5]

  attr_accessible :failed_tries, :minute, :name, :successful_tries, :summary, :url, :user_id, :good_site

  before_validation :set_minute
    
  validates_inclusion_of :minute, :in => VALID_VALUES, :message => "%{value} is not a valid value, must be one of 0, 1, 2, 3, 4 or 5" 
  validates_presence_of :minute

  validates_presence_of :minute

  validates_presence_of :user_id
  validates_presence_of :url
  validates_presence_of :good_site
  validates_presence_of :name
  validates_format_of :url, :with => /^(http):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix

  belongs_to :user

protected
  def set_minute
    self.minute = VALID_VALUES.sample
  end


end
