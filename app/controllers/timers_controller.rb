class TimersController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!

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

end
