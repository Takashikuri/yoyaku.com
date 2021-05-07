class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.all
  end
  def new
    @reservation = Reservation.new
  end
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
    redirect_to reservations_path
    else
    render :new
    end
  end
  
  private
   def reservation_params
     params.require(:reservation).permit(:sign_up_day,:reserve_day, :reserve_name, :reserve_phone_number, :member, :course, :medium, :seat_number)
   end 
end
