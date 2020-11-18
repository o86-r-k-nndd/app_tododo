class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.text       :text
      t.string     :name
      t.references :user
      t.timestamps
    end
  end
end
