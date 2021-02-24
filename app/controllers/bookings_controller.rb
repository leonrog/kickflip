class BookingsController < ApplicationController
  def index
    # not yet completed
    @bookings = Booking.all
  end

  def show
    # not yet completed
    # @booking = Booking.find(params[:booking_id])
    # @obstacle = Obstacle.find(params[:obstacle_id])

  end

  def create
    @obstacle = Obstacle.find(params[:obstacle_id])
    @booking = Booking.new(booking_params)
    @booking.obstacle = @obstacle
    @user = current_user
    @booking.user = @user
    if @booking.save
      redirect_to obstacle_path(@obstacle)
    else
      render 'obstacles/show'
    end
  end

  def destroy
  # not completed yet
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to obstacle_path(@booking.obstacle)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
