class Cto < ActiveRecord::Base
  validates :name, presence: true

  has_many  :opportunities
end
