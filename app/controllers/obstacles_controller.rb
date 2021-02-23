class ObstaclesController < ApplicationController
  def index
    @obstacles = Obstacle.all
  end

  def new
    @obstacle = Obstacle.new
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
    @obstacle = Obstacle.find(params[:id])
  end

  def edit
    @obstacle = Obstacle.find(params[:id])
  end


  def update
    @obstacle = Obstacle.update(obstacle_params)

    redirect_to obstacle_path(@obstacle)
  end

  def destroy
    @obstacle = Obstacle.find(params[:id])
    @obstacle.destroy

    redirect_to obstacles_path
  end

  private

  def obstacle_params
    params.require(:obstacle).permit(:name, :category, :price, :availability, :location)
  end
end
