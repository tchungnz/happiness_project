require 'json'

class SkillsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if current_user
      @skills = current_user.skills
      @skillsarray = []
      @con_array = []
      @first_array = []
      @skills.each {|skill| @skillsarray.push(skill.name)}
      i = 0
      if @skills
        @skills.each do
          @first_array.push(@skills[i].confidences[0].rating)
          @con_array.push(@skills[i].confidences[-1].rating)
          i += 1
        end
      end
    end
  end


  def new
    if !current_user.skills.empty?
      redirect_to '/confidences/new'
    else
    @skill_names = ["Ruby", "Javascript", "HTML", "CSS", "Command Line", "Communication", "Project Work", "TDD", "Agile", "OOP", "Rails", "Databases", "ORM", "jQuery", "Version Control"]
    i = 0
    15.times do
      Skill.create(name: @skill_names[i], user_id: current_user.id)
      i += 1
    end
    redirect_to '/confidences/new'
    end
  end

  def create
    redirect_to '/confidences/new'
  end


  def show
      @skill = Skill.find(params[:id])
      @skilldata = []
      @skill.confidences.each do |confidence|
        @skilldata << confidence.rating
      end
      @skillsdata = @skilldata.last(7)
  end

  private

  def skills_params
    params.require(:skill).permit(:name)
  end

  def confidence_params
    params.require(:confidence).permit(:rating)
  end
end
