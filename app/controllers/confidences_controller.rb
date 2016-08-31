class ConfidencesController < ApplicationController
  before_action :authenticate_user!

  def new
    @skills = current_user.skills
  end

  def create
    i=0
    15.times do
      Confidence.create(:rating => (params[:feedback][i][:rating]),
                    :skill_id => params[:feedback][i][:skill_id])
      i += 1
    end
      redirect_to skills_path
  end


  private

  def confidence_params
    params.require(:confidence).permit(:rating, :skill_id)
  end

end
