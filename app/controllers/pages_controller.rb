class PagesController < ApplicationController
  def home
    @obstacles = Obstacle.all
  end
end
