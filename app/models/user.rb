class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :email, :password, :password_confirmation
  validates_confirmation_of :password, message: 'Both passwords should match'

  has_many :links
end
