class ManagesController < ApplicationController
  
 
  
  def index
   
  
    # if !params[:q].blank?
      
      # @q = Reservation.ransack(params[:q])
      # @res = @q.result(distinct: true)
    # @manages = Manage.where(created_at: params[:created_at].in_time_zone.all_day).order(start_time: 'ASC')
      
      @q = Manage.ransack(params[:q])
      @manages = @q.result(distinct: true)
      
      # @res = Reservation.where(reserve_day: params[:created_at]).order(reserve_day: 'ASC')
      @q = Reservation.ransack(params[:q])
      @res = @q.result(distinct: true)
    # elsif params[:created_at] && params[:sort_coulmn] == "table_number" && params[:sort_type] == "ASC"
    #   @manages = Manage.where(created_at: params[:created_at].in_time_zone.all_day).order(table_number: :ASC)
    #   @res = Reservation.all.order(reserve_day: 'ASC')
    
    # elsif params[:created_at]  && params[:sort_coulmn] == "member"
    #   @manages = Manage.where(created_at: params[:created_at].in_time_zone.all_day).order(member: :desc) 
    #   @res = Reservation.all.order(reserve_day: 'ASC')
    
    # else
    # # #   # @q = Manage.ransack(params[:q])
    # # #   # @manages = @q.result(distinct: true)
    # #   @q = Manage.all.order(start_time: 'ASC')
    #   # @res = Reservation.all
    # end
    
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
    @manage = Manage.find(params[:id])
   
    if @manage.update(manage_params) || @manage.update(check_parmas)
      redirect_to manages_path(params[:created_at]), success: '更新しました'
    else
      flash.now[:danger] = '更新失敗しました'
      render :new
    end
  end
  
  def destroy
    @manage = Manage.find(params[:id])
    @manage.destroy
    redirect_to manages_path
  end
 
  private
   def manage_params
     params.require(:manage).permit(:table_number,:member, :start_time, :last_time, :finish_time, :course, :coupon, :remarks, :created_at)
   end
   def check_params
     params.require(:manage).permit(:last, :accounting, :closed)
   end
   
end

