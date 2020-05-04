class Landlord < ActiveRecord::Base
  has_many :apartments

  validates :first_name, presence: true
  validates :second_name, presence: true
  validates :phone, presence: true
  validates :email, presence: true, email_format: {message: 'is not looking good'},
    uniqueness: true 

  def full_name
    return first_name + " " + second_name
  end


end
