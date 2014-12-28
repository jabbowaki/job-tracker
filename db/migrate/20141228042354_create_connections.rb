class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.belongs_to  :opportunity
      t.belongs_to  :advocate
      t.timestamps
    end
  end
end
