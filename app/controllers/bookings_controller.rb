class BookingsController < ApplicationController
  def index
    # not needed for now
    @bookings = Booking.all
  end

  def create
    @obstacle = Obstacle.find(params[:obstacle_id])
    @booking = Booking.new(booking_params)
    @booking.obstacle = @obstacle
    @user = current_user
    @booking.user = @user
    authorize @booking
    if @booking.save
      redirect_to obstacle_path(@obstacle), notice: 'Successfully booked'
    else
      render 'obstacles/show'
    end
  end

  def destroy
  # not completed yet/ not needed for demo
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    redirect_to my_dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
