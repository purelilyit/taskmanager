class CreateCompletedTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :completed_tasks do |t|
      t.text :title
      t.text :next

      t.timestamps
    end
  end
end
