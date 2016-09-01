require 'json'

class SkillsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if current_user
      @skills = current_user.skills
      @skillsarray = []
      @skills.each {|skill| @skillsarray.push(skill.name)}
      if current_user.skills.any? && current_user.skills[0].confidences.any?
        i = 0
        @con_array = []
        @skills.each do
          @con_array.push(@skills[i].confidences[-1].rating)
          i += 1
        end
      end
    end
  end


  def new
    if current_user.skills.empty?
    @skill_names = ["Ruby", "Javascript", "HTML", "CSS", "Command Line", "Communication", "Project Work", "TDD", "Agile", "OOP", "Rails", "Databases", "ORM", "jQuery", "Version Control"]
    @skills = []
    @confidences = []
    i = 0
      15.times do
        @skills << Skill.create(name: @skill_names[i], user_id: current_user.id)
        @confidences << Confidence.new
        i += 1
      end
    end
    redirect_to '/confidences/new'
  end

  def create
    redirect_to '/confidences/new'
  end


  def show
      @skill = Skill.find(params[:id])
      @skilldata = []
      i = 0
      @skill.confidences.each do |confidence|
        @skilldata << confidence.rating
        i += 1
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
