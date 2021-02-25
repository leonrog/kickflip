class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    authorize @reviews
  end

  def new
    @obstacle = Obstacle.find(params[:obstacle_id])
    @review = Review.new
    authorize @review
  end

  def create
    @obstacle = Obstacle.find(params[:obstacle_id])
    @review = Review.new(params_hard)
    @user = current_user
    @review.obstacle = @obstacle
    @review.user = @user
    authorize @review
    @review.save
    redirect_to obstacle_path(@obstacle)
  end

  private

  def params_hard
    params.require(:review).permit(:title, :description, :rating)
  end

end
