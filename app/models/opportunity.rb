class Opportunity < ActiveRecord::Base
  validates  :user, :name, :website, presence: true

  belongs_to :user
  belongs_to  :cto
  has_many  :actions
  has_many  :connections
  has_many  :advocates, through: :connections
end
