class ObstaclesController < ApplicationController
  before_action :set_obstacle, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :show
  # def index
  #   # if params[:query].present?
  #   #   @obstacles = policy_scope(Obstacle).where("name ILIKE ?", "%#{params[:query]}%")
  #   # else
  #   #   @obstacles = policy_scope(Obstacle).order(created_at: :desc)
  #   # end
  #   # @obstacles = policy_scope(Obstacle).order(created_at: :desc)
  # end

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
    @reviews = Review.where(obstacle_id: params[:id])
    @booking = Booking.new
    authorize @obstacle
  end

  def edit
    authorize @obstacle
  end

  def update
    authorize @obstacle
    @obstacle.update(obstacle_params)
    redirect_to obstacle_path(@obstacle)
  end

  def destroy

    @obstacle.destroy
    authorize @obstacle
    redirect_to my_dashboard_path
  end

  def dashboard
    @obstacles = current_user.obstacles
    @bookings = current_user.bookings
    authorize @obstacles
  end

  private

  def set_obstacle
    @obstacle = Obstacle.find(params[:id])
  end

  def obstacle_params
    params.require(:obstacle).permit(:name, :category, :price, :availability, :location, :description, :photo)
  end
end
