class SkillsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @skills = Skill.all
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.create(skills_params)
    redirect_to '/skills'
  end

  private

  def skills_params
    params.require(:skill).permit(:name, :confidence)
  end

end
