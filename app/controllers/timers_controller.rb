class TimersController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # ミニタスクに紐づいた日付の情報を取得する処理
  before_action :set_data

  # 日付選択
  def index
  end
  # 今日
  def today
  end
  # 明日
  def tomorrow
  end
  # いつか
  def someday
  end

  private
  # ミニタスクに紐づいた日付の情報を取得する処理
  def set_data
    times = []
    @genres = Genre.where(user_id: current_user.id)
    @genres.each do |genre|
      genre.tasks.each do |task|
        @task_minitasks = TaskMinitask.where(task_id: task.id)
        @task_minitasks.each do |minitask|
          @timers = Timer.where(minitask_id: minitask.minitask_id)
          @timers.each do |timer|
            times << timer
          end
        end
      end
    end
  end

end
