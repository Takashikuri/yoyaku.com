class ReservationsController < ApplicationController
  def index
   
    if params[:reserve_day].present?
      @reservations = Reservation.where(reserve_day: params[:reserve_day].in_time_zone.all_day)
    else
      @reservations = Reservation.all
    end
  end
 
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
   
    if @reservation.valid? && @reservation.save
      redirect_to reservations_path, success: '予約の登録が出来ました。'
    else
      flash.now[:danger] = '予約の登録が出来ませんでした。'
      render :new
    end
  end
  
  def edit
    @reservation = Reservation.find(params[:id])
  end
  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render :new
    end
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end
  # def delete
  #   @reservation = Reservation.find(params[:id])
  #   @reservation.destroy
  #   redirect_to reservations_path
  # end
  private
   def reservation_params
     params.require(:reservation).permit(:sign_up_day,:reserve_day, :reserve_name, :reserve_phone_number, :member, :course, :medium, :seat_number)
   end 
   
end
