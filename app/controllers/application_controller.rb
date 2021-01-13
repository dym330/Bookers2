class ApplicationController < ActionController::Base
  # deviseが動いた際のみconfigure_permitted_parametersを動かす
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ユーザー登録の際"sign_up"にユーザー名"name"のデータ操作の許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end