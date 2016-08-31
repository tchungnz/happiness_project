class SkillsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if current_user
      @skills = current_user.skills
    end
  end

  def new
    @skill = Skill.new
    @confidence = Confidence.new
  end

  def create
    @skill = Skill.new(skills_params)
    @skill.user_id = current_user.id
    if @skill.save
      @confidence = Confidence.new(confidence_params)
      @confidence.skill_id = @skill.id
      if @confidence.save
        redirect_to skills_path
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  private

  def skills_params
    params.require(:skill).permit(:name)
  end

  def confidence_params
    params.require(:confidence).permit(:rating)
  end

end
