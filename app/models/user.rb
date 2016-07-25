class User < ActiveRecord::Base
  has_secure_password
  has_many :links

  validates :email, presence: true, uniqueness: true
  validates_confirmation_of :password, message: 'Both passwords should match'
end
