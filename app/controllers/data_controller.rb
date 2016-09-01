class DataController < ApplicationController
  def index
    if current_user
      @skills = current_user.skills
    else
      redirect_to '/users/sign_in'
    end
  end
end
