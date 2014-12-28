class Connection < ActiveRecord::Base
  validates :advocate, presence: true
  validates :opportunity, presence: true

  belongs_to  :advocate
  belongs_to  :opportunity
end
