class CreateTaskMinitasks < ActiveRecord::Migration[6.0]
  def change
    create_table :task_minitasks do |t|
      t.references :task
      t.references :minitask
      t.timestamps
    end
  end
end
