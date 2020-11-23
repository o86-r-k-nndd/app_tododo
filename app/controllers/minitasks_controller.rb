class MinitasksController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # 別のユーザーが遷移しようとした時
  before_action :login_user_task?
  # ジャンルの値を取得
  before_action :set_table_genre_find
  # タスクの値を取得
  before_action :set_table_task_find
  # ミニタスクの値を取得
  before_action :set_table_minitask_find, only: [:edit, :update, :destroy]

  # minitask一覧
  def index
    @minitask = Minitask.order(id: :DESC).all
  end
  # 新規ミニタスク作成
  def new
    @minitask_timer = MinitaskTimer.new
  end
  # 保存
  def create
    @minitask_timer = MinitaskTimer.new(minitask_timer_params)
    if @minitask_timer.valid?
      @minitask_timer.save
      redirect_to action: :index
    else
      set_table_genre_find
      set_table_task_find
      @minitask_timer.valid?
      render :new
    end
  end
  # 編集
  def edit
  end
  # 更新
  def update
    binding.pry
    if @minitask.update(minitask_params)
      redirect_to action: :index
    else
      set_table_genre_find
      set_table_task_find
      @minitask.valid?
      render :edit
    end
  end
  # 削除
  def destroy
    @minitask.destroy
    redirect_to action: :index
  end

  private
  # ストロングパラメーター
  def minitask_params
    params.require(:minitask).permit(:name, :text)
  end
  def minitask_timer_params
    params.require(:minitask_timer).permit( :name,
                                            :text,
                                            :time
                                  ).merge(
                                            task_id: params[:task_id])
  end
  # ジャンルのテーブルを取得
  def set_table_genre_find
    @genre = Genre.find(params[:genre_id])
  end
  # タスクのテーブルを取得
  def set_table_task_find
    @task = Task.find(params[:task_id])
  end
  # ミニタスクのテーブルを取得
  def set_table_minitask_find
    @minitask = Minitask.find(params[:id])
  end
  # 別のユーザーが遷移しようとした時
  def login_user_task?
    @genre_log = Genre.find(params[:genre_id])
    unless current_user.id == @genre_log.user_id
      redirect_to root_path
    end
  end

end
