class CreateMinitasks < ActiveRecord::Migration[6.0]
  def change
    create_table :minitasks do |t|
      t.text        :text
      t.string      :name
      t.references  :task
      t.timestamps
    end
  end
end
