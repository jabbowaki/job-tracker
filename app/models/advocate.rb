class Advocate < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  belongs_to  :opportunity
  belongs_to  :action
end
