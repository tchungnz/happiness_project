class DataController < ApplicationController
  def index
    @skills = current_user.skills
  end
end
