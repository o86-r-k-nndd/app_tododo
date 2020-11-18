class ApplicationController < ActionController::Base

  #deviseのコントローラーの処理を実行する前にメソッドの処理を行う
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  #サインアップ時deviseで用いるparamsのデータにカラムを追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
