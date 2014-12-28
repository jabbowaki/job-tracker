class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.belongs_to :advocate_id
      t.date  :meeting_date
      t.date  :reached_out
      t.date  :followed_up
      t.text  :notes

      t.timestamps
    end
  end
end
