class ObstaclesController < ApplicationController
  def index
    @obstacles = Obstacle.all
  end

  def new
    @obstacle = Obstacle.new
    authorize @obstacle
  end

  def create
    @obstacle = Obstacle.new(obstacle_params)
    @user = current_user
    @obstacle.user = @user
    authorize @obstacle
    if @obstacle.save
      redirect_to obstacle_path(@obstacle)
    else
      render 'new'
    end
  end

  def show
    @obstacle = Obstacle.find(params[:id])
    @booking = Booking.new
  end

  def edit
    @obstacle = Obstacle.find(params[:id])
    authorize @obstacle
  end

  def update
    @obstacle = Obstacle.update(obstacle_params)
    authorize @obstacle
    redirect_to obstacle_path(@obstacle)
  end

  def destroy
    @obstacle = Obstacle.find(params[:id])
    @obstacle.destroy

    redirect_to obstacles_path
  end

  def dashboard
    @obstacles = current_user.obstacles
    @bookings = current_user.bookings
    authorize @obstacles
  end

  private

  def obstacle_params
    params.require(:obstacle).permit(:name, :category, :price, :availability, :location, :description, :photo)
  end
end
