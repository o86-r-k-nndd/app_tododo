class TasksController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # ジャンルの値を取得
  before_action :set_genre, only: [:index, :new]
  
  # タスク一覧
  def index
    @task = Task.order(id: :DESC).all
  end
  # 新規タスク作成
  def new
    @task = Task.new
  end
  # タスクをデータベースへ保存
  def create
    @task = Task.new(task_params)
    if @task.save
      save_genre_task
      redirect_to action: :index
    else
      set_genre
      render :new
    end
  end

  private
  # ストロングパラメーター
  def task_params
    params.require(:task).permit(:name, :text)
  end
  # 送られてきたジャンルのテーブルを取得
  def set_genre
    @genre = Genre.find(params[:genre_id])
  end
  # 中間テーブルへ保存する処理
  def save_genre_task
    set_genre
    @genre_task = GenreTask.new(genre_id: @genre.id, task_id: @task.id)
    @genre_task.save
  end

end
