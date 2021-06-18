class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  add_flash_types :success, :info, :warning, :danger, :alert
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])    #@current_user = User.find_by(id: session[:user_id])で定義すると
  end                                                        #@current_userを呼び出すたびにデータベースを検索すると遅くなる。
                                                             #そのためメソッド化する
                                                          
  def logged_in?
    !current_user.nil?
  end
  
end
