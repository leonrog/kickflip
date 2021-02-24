class PagesController < ApplicationController
  def home
    @obstacles = Obstacle.all
  end

  def dashboard
    # we'll do this after wednesday's demo
    # current_user.obstacles
    # current_user.bookings
  end
end
