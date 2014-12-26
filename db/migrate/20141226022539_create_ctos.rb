class CreateCtos < ActiveRecord::Migration
  def change
    create_table :ctos do |t|

      t.timestamps
    end
  end
end
