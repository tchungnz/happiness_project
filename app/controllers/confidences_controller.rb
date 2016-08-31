class ConfidencesController < ApplicationController
  before_action :authenticate_user!

  def new
    @skills = current_user.skills
  end

  def create
    @confidence1 = Confidence.create(:rating => (params[:feedback][0][:rating]),
                  :skill_id => params[:feedback][0][:skill_id])
    @confidence2 = Confidence.create(:rating => (params[:feedback][1][:rating]),
                  :skill_id => (params[:feedback][1][:skill_id]))
      redirect_to skills_path
  end


  private

  def confidence_params
    params.require(:confidence).permit(:rating, :skill_id)
  end

end
