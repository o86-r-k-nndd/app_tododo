class CreateTimers < ActiveRecord::Migration[6.0]
  def change
    create_table :timers do |t|
      t.date        :time
      t.integer     :day_id
      t.timestamps
    end
  end
end
