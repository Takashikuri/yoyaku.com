class SessionsController < ApplicationController
  def new
    # user = User.new
  end
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      redirect_to pages_path
    else
      render new_user_path
    end
    
  end


private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
