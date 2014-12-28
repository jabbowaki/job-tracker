class Action < ActiveRecord::Base
  validates :opportunity, presence: true
  validates :description, presence: true

  belongs_to  :advocate
  belongs_to  :opportunity
end
