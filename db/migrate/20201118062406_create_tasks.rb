class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text        :text
      t.string      :name
      t.references  :genre
      t.timestamps
    end
  end
end
