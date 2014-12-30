class Advocate < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  has_many  :connections
  has_many  :opportunities, through: :connections
  has_many  :actions
end
