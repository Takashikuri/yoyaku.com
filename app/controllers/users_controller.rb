class UsersController < ApplicationController
 
  # def new
  #   @user = User.new
  # end
  def new
    @user = User.new  
  end
  def create
    @user = User.new(user_params)
    # binding.pry
    if @user.save
      redirect_to root_path, success: '登録出来ました'
    else
      flash[:validation_messages] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end
  # def create
  #   @user = User.new(user_params)
   
  #   if @user.save # => Validation
  #     # Sucess
  #     # @user.send_activation_email
  #     # session[:user] = nil # *1 成功した際は速やかに削除する
  #     redirect_to root_url, success: '登録出来ました'
  #   else
  #     # Failure
  #     # session[:user] = @user.attributes.slice(user_params.keys) # *2 フォームで渡された値のみ保存
  #     # *3 session[:user] = user_params としないこと！
  #     redirect_to new_user_path
  #     flash[:danger] = '登録できませんでした'
  #     # redirect_to new_user_path
  #   end
  # end


private
  def user_params
    params.require(:user).permit(:store_name, :phone_number, :address, :email, :password, :password_confirmation)
  end
end
