class MinitasksController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # 別のユーザーが遷移しようとした時
  before_action :login_user_task?
  # ジャンルの値を取得
  before_action :set_table_genre_find
  # タスクの値を取得
  before_action :set_table_task_find

  # minitask一覧
  def index
  end
  # 新規ミニタスク作成
  def new
    @minitask = Minitask.new
  end
  # 保存
  def create
    @minitask = Minitask.new(minitask_params)
    if @minitask.save
      save_task_minitask
    else
      set_table_genre_find
      set_table_task_find
      render :new
    end
  end

  private
  # ストロングパラメーター
  def minitask_params
    params.require(:minitask).permit(:name, :text)
  end
  # ジャンルのテーブルを取得
  def set_table_genre_find
    @genre = Genre.find(params[:genre_id])
  end
  # タスクのテーブルを取得
  def set_table_task_find
    @task = Task.find(params[:task_id])
  end
  # 中間テーブルへ保存する処理
  def save_task_minitask
    set_table_task_find
    @task_minitask = TaskMinitask.new(task_id: @task.id, minitask_id: @minitask.id)
    if @task_minitask.save
      redirect_to action: :index
    else
      set_table_genre_find
      set_table_task_find
      render :new
    end
  end
  # 別のユーザーが遷移しようとした時
  def login_user_task?
    @genre_log = Genre.find(params[:genre_id])
    unless current_user.id == @genre_log.user_id
      redirect_to root_path
    end
  end

end
