class GenresController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!
  # 別ユーザーはトップページへ遷移
  before_action :login_user_genre?, only: [:create]

  # Top
  def index
    @genre = Genre.all.order(id: :DESC).where(user_id: current_user.id)
  end
  # 新規ジャンル作成
  def new
    @genre = Genre.new
  end
  # データベースへ保存
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  # ストロングパラメータ
  def genre_params
    params.require(:genre).permit(:name, :text).merge(user_id: current_user.id)
  end
  # 他のユーザーのジャンルの画面へ遷移しようとした時
  def login_user_genre?
    @genre = Genre.new(genre_params)
    unless current_user.id == @genre.user_id
      redirect_to root_path
    end
  end

end
