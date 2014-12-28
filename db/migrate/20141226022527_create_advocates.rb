class CreateAdvocates < ActiveRecord::Migration
  def change
    create_table :advocates do |t|
      t.string  :name
      t.string  :twitter
      t.string  :blog
      t.timestamps
    end
  end
end
