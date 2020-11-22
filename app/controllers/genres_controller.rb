class GenresController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # 別ユーザーはトップページへ遷移
  before_action :login_user_genre?, only: [:edit, :update, :destroy]
  # モデルの生成
  before_action :set_table_genre, only: [:edit, :update, :destroy]

  # Top
  def index
    @genre = Genre.order(id: :DESC).where(user_id: current_user.id)
  end
  # 新規ジャンル作成
  def new
    @genre = Genre.new
  end
  # 保存
  def create
    @genre = Genre.new(genre_params)
    if @genre.valid?
      @genre.save
      redirect_to root_path
    else
      render :new
    end
  end
  # 編集
  def edit
  end
  # 更新
  def update
    if @genre.update(genre_params)
      redirect_to root_path
    else
      @genre.valid?
      render :edit
    end
  end
  # 削除
  def destroy
    @genre.destroy
    redirect_to root_path
  end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name, :text).merge(user_id: current_user.id)
  end
  # 他のユーザーのジャンルの画面へ遷移しようとした時
  def login_user_genre?
    @genre_log = Genre.find(params[:id])
    unless current_user.id == @genre_log.user_id
      redirect_to root_path
    end
  end
  # 特定のテーブルの値を取得
  def set_table_genre
    @genre = Genre.find(params[:id])
  end

end
