class GenresController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!

  # Top
  def index
  end

  # 新規ジャンル作成
  def new
    @genre = Genre.new
  end

  # データベースへ保存
  def create
    @genre = Genre.new(genre_params)
    binding.pry
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

end
