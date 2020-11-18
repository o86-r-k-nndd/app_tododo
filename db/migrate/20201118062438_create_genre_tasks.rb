class CreateGenreTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :genre_tasks do |t|

      t.timestamps
    end
  end
end
