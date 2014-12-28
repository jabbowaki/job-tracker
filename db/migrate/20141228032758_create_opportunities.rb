class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.belongs_to  :user
      t.string  :name
      t.string  :website
      t.string  :career_page
      t.text  :notes
      t.belongs_to  :cto
      t.boolean :applied?, default: false
      t.boolean :offer?, default: false
      t.boolean :open_job?, default: false
      t.timestamps
    end
  end
end
