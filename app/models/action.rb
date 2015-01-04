class Action < ActiveRecord::Base
  validates :opportunity, presence: true
  validates :description, presence: true

  belongs_to  :advocate
  belongs_to  :opportunity

  scope :recent, -> { order("updated_at desc").limit(5)}
end
