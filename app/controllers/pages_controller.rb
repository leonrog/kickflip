
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if params[:query].present?
      @obstacles = policy_scope(Obstacle).where("name ILIKE ?", "%#{params[:query]}%")
    else
      @obstacles = policy_scope(Obstacle).order(created_at: :desc)
    end
  end
end
