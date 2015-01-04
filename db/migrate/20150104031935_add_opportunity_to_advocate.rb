class AddOpportunityToAdvocate < ActiveRecord::Migration
  def change
    add_column :advocates, :opportunity_id, :integer
  end
end
