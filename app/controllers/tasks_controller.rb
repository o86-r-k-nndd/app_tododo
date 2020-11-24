class TasksController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # ジャンルの値を取得
  before_action :set_table_genre_find, only: [:index, :new, :edit]
  # タスクの値を取得
  before_action :set_table_task_find,  only: [:edit, :update, :destroy]
  # 別のユーザーが遷移しようとした時
  before_action :login_user_task?

  # タスク一覧
  def index
    @task = Task.order(id: :DESC).where(genre_id: params[:genre_id])
  end
  # 新規タスク作成
  def new
    @task = Task.new
  end
  # 保存
  def create
    @task = Task.new(task_params)
    if @task.valid?
      save_genre_task
    else
      set_table_genre_find
      @task.valid?
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
      @task.valid?
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
    params.require(:task).permit(:name, :text).merge(genre_id: params[:genre_id])
  end
  # ジャンルのテーブルを取得
  def set_table_genre_find
    @genre = Genre.find(params[:genre_id])
  end
  # タスクのテーブルを取得
  def set_table_task_find
    @task = Task.find(params[:id])
  end
  # 複数のモデルへ保存する処理
  def save_genre_task
    set_table_genre_find
    if @task.valid?
      @task.save
      @genre_task = GenreTask.new(genre_id: @genre.id, task_id: @task.id)

      if @genre_task.valid?
        @genre_task.save
        redirect_to action: :index
      else
        set_table_genre_find
        @task.valid?
        render :new
      end

    else
      set_table_genre_find
      @task.valid?
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
