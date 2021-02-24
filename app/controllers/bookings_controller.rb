class BookingsController < ApplicationController
  def index
    # not needed for now
    @bookings = Booking.all
  end

  def show
    # not needed -> we'll create a dashboard instead
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
  # not completed yet/ not needed for demo
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to obstacle_path(@booking.obstacle)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
