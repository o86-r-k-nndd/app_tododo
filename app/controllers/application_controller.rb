class ApplicationController < ActionController::Base
  #deviseのコントローラーの処理を実行する前にメソッドの処理を行う
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Basic認証
  before_action :basic_auth

  private
  # サインアップ時deviseで用いるparamsのデータにカラムを追加する
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  # Basic認証を行う
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER_FURIMA"] && password == ENV["BASIC_AUTH_PASSWORD_FURIMA"]
    end
  end

end
