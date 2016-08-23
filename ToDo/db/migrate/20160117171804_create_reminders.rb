class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
    	t.string :title
    	t.string :description
    	t.string :due_date
    	t.integer :priority
    	t.boolean :finished
      t.timestamps
    end
  end
end
