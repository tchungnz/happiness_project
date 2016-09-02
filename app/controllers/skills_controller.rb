require 'json'

class SkillsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if current_user
      @skills = current_user.skills
      if @skills
        @skillsarray = find_skill_names
        @con_array = find_latest_ratings
        @first_array = find_first_ratings
      end
    end
  end

  def new
    if current_user.skills.empty?
      create_skills
    end
    redirect_to '/confidences/new'
  end

  def create
    redirect_to '/confidences/new'
  end


  def show
    @skill = Skill.find(params[:id])
    @skillsdata = find_current_skills
  end

  private

  def skills_params
    params.require(:skill).permit(:name)
  end

  def confidence_params
    params.require(:confidence).permit(:rating)
  end

  def create_skills
    @skill_names = Skill.base_skills
    i = 0
    @skill_names.length.times do
      Skill.create(name: @skill_names[i], user_id: current_user.id)
      i += 1
    end
  end

  def find_current_skills
    @skilldata = []
    @skill.confidences.each do |confidence|
      @skilldata << confidence.rating
    end
    @skilldata.last(7)
  end

  def find_latest_ratings
    con_array = []
    i = 0
    @skills.each do
      con_array.push(@skills[i].confidences[-1].rating)
      i += 1
    end
    return con_array
  end

  def find_first_ratings
    first_array = []
    i = 0
    @skills.each do
      first_array.push(@skills[i].confidences[0].rating)
      i += 1
    end
    return first_array
  end

  def find_skill_names
    skills_array = []
    @skills.each {|skill| skills_array.push(skill.name)}
    return skills_array
  end

end
