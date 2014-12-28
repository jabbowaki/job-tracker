class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string  :description
      t.belongs_to  :opportunity
      t.belongs_to :advocate
      t.date  :meeting_date
      t.date  :reached_out
      t.date  :follow_up
      t.text  :notes

      t.timestamps
    end
  end
end
