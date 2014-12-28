class Advocate < ActiveRecord::Base
  has_many  :connections
  has_many  :opportunities, through: :connections
  has_many  :actions
end
