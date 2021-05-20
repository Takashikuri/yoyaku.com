class ManagesController < ApplicationController
  def index
    @manages = Manage.all
  end
  
  def new
    @manage = Manage.new
  end
 
  def create
    @manage = Manage.new(manage_params)
   
    if @manage.save
      redirect_to manages_path, success: '予約の登録が出来ました。'
    else
      flash.now[:danger] = '予約の登録が出来ませんでした。'
      render :new
    end
  end
  
  def edit
    @manage = Manage.find(params[:id])
  end
  def update
    @Manage = Manage.find(params[:id])
    if @manage.update(manage_params)
      redirect_to manages_path
    else
      render :new
    end
  end
  
  def destroy
    @manage = Manage.find(params[:id])
    @manage.destroy
    redirect_to manages_path
  end
  # def delete
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.destroy
  #   redirect_to reservations_path
  # end
  private
   def manage_params
     params.require(:manage).permit(:table_number,:member, :start_time, :last_time, :finish_time, :course, :coupon, :remarks)
   end 
   
end

