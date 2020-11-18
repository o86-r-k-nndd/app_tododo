class UsersController < ApplicationController
  # ログインしていない場合はログイン画面へ遷移
  before_action :authenticate_user!

  def index
  end
  
end
