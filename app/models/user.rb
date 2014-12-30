class User < ActiveRecord::Base
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /.+@.+\.{1}.+/ }
  validates :password, length: { minimum: 8 }

  has_many  :opportunities
  has_secure_password
end
