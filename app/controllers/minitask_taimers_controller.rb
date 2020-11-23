class TimersController < ApplicationController
  # Form Object
  include ActiveModel::Model
  
  # coloum
  attr_accessor :time,
                :name,
                :text,
                :task_id,
                :minitask_id

  # Validateion
  with_option presence: true do
    validates :time
    validates :name
    validates :text
    validates :task_id
    validates :minitask_id
  end

  # 複数モデルへの保存
  def save
    # タスクの取得
    @task = Task.find(task_id)
    # ミニタスクへの保存
    @minitask = Minitask.create(name: name, text: text)
    # 日付情報の取得
    @time = Timer.create(time: time, minitask_id: @minitask.id)
    # 中間テーブルへの保存
    @task_minitask = TaskMinitask.create(task_id: @task.id, minitask_id: @minitask.id)
  end
end