class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.text       :text
      t.string     :name
      t.references :genre_task
      t.timestamps
    end
  end
end
