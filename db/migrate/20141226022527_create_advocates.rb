class CreateAdvocates < ActiveRecord::Migration
  def change
    create_table :advocates do |t|

      t.timestamps
    end
  end
end
