class Cto < ActiveRecord::Base
  validates :name, presence: true
  validates :email, format: { with: /.+@.+\.{1}.+/ }

  has_many  :opportunities
end
