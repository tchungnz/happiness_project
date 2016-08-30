class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def new

  end

  def create
    Skill.create(skills_params)
    redirect_to '/skills'
  end

  private

  def skills_params
    params.require(:skill).permit(:name, :confidence)
  end 

end
