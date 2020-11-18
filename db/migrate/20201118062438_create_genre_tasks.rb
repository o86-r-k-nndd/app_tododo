class CreateGenreTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_tasks do |t|
      t.references :genre
      t.references :task
      t.timestamps
    end
  end
end
