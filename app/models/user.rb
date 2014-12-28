class User < ActiveRecord::Base
  has_many  :opportunities
  has_secure_password
end
