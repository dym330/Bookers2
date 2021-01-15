class ApplicationController < ActionController::Base
  # deviseが動いた際のみconfigure_permitted_parametersを動かす
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ログインしていない人は表示できない
  before_action :authenticate_user!,except: [:top, :about]

  def after_sign_in_path_for(resource)
    # idの情報はresourceが持っている
    # printデバッグで確認　<User id: 1, email: "a@a", name: "aaa", introduction: "aa",…
    user_path(resource)
  end

  protected

  # ユーザー登録の際"sign_up"にユーザー名"name"のデータ操作の許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end

end

