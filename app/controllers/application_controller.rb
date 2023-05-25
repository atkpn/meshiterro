class ApplicationController < ActionController::Base
  # deviseの機能（ユーザ登録、ログイン認証など）が使われる前にオレンジのメソッドが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
