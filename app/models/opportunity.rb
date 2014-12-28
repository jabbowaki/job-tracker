class Opportunity < ActiveRecord::Base
  belongs_to :user
  belongs_to  :action
  belongs_to  :cto
  has_many  :connections
  has_many  :advocates, through: :connections
end
