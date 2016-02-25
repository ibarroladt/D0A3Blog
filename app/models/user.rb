class User < ActiveRecord::Base

  validates_presence_of :email
  validates :email, uniqueness: true
  has_secure_password

end
