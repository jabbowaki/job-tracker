class Action < ActiveRecord::Base
  belongs_to  :advocate
  belongs_to  :opportunity
end
