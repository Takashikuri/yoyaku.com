class SessionsController < ApplicationController
  def new
    # user = User.new
  end
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      log_in user
      redirect_to pages_path, success: 'ログイン成功'
    else
      flash[:danger] = 'email/パスワードを正しく入力してください'
      redirect_to root_path
      # error.message
    end
  end
  
  def destroy
    log_out
    redirect_to root_path, info: 'ログアウトしました'
  end


private
  def log_in(user)
    session[:user_id] = user.id
  end
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
