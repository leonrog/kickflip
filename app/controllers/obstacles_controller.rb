class ObstaclesController < ApplicationController
  def index
    @obstacles = Obstacle.all
  end

  def new
    @obstacle = Obstacle.new
  end

  def update
  end

  def create
    @obstacle = Obstacle.new(obstacle_params)
    @user = current_user
    @obstacle.user = @user
    if @obstacle.save
      redirect_to obstacle_path(@obstacle)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def delete
  end

  private

  def obstacle_params
    params.require(:obstacle).permit(:name, :category, :price, :availability, :location)
  end
end
