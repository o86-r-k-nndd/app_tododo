class TasksController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # ジャンルの値を取得
  before_action :set_table_genre_find, only: [:index, :new, :edit]
  # タスクの値を取得
  before_action :set_table_task_find,  only: [:edit, :update, :destroy]

  # タスク一覧
  def index
    @task = Task.order(id: :DESC).all
  end
  # 新規タスク作成
  def new
    @task = Task.new
  end
  # 保存
  def create
    @task = Task.new(task_params)
    if @task.save
      save_genre_task
      redirect_to action: :index
    else
      set_table_genre_find
      render :new
    end
  end
  # 編集
  def edit
  end
  # 更新
  def update
    if @task.update(task_params)
      redirect_to action: :index
    else
      set_table_genre_find
      set_table_task_find
      render :edit
    end
  end
  # 削除
  def destroy
    @task.destroy
    redirect_to action: :index
  end

  private
  # ストロングパラメーター
  def task_params
    params.require(:task).permit(:name, :text)
  end
  # ジャンルのテーブルを取得
  def set_table_genre_find
    @genre = Genre.find(params[:genre_id])
  end
  # タスクのテーブルを取得
  def set_table_task_find
    @task = Task.find(params[:id])
  end
  # 中間テーブルへ保存する処理
  def save_genre_task
    set_table_genre_find
    @genre_task = GenreTask.new(genre_id: @genre.id, task_id: @task.id)
    @genre_task.save
  end

end
