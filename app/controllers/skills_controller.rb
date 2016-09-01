require 'json'

class SkillsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    if current_user
      @skills = current_user.skills
      @skillsarray = []
      @skills.each {|skill| @skillsarray.push(skill.name)}
      i = 0
      @con_array = []
      @skills.each do
        @con_array.push(@skills[i].confidences[-1].rating)
        i += 1
      end
    end
  end


  def new
    if !current_user.skills.empty?
      redirect_to '/confidences/new'
    else
    @skill_names = ["Ruby", "Javascript", "HTML", "CSS", "Command Line", "Communication", "Project Work", "TDD", "Agile", "OOP", "Rails", "Databases", "ORM", "jQuery", "Version Control"]
    @skills = []
    @confidences = []
    i = 0
    15.times do
      @skills << Skill.create(name: @skill_names[i], user_id: current_user.id)
      @confidences << Confidence.new
      i += 1
    end
    redirect_to '/confidences/new'
    end
  end

  def create
    redirect_to '/confidences/new'
  end

  # def create
  #   @skill = Skill.new(skills_params)
  #   @skill.user_id = current_user.id
  #   if @skill.save
  #     @confidence = Confidence.new(confidence_params)
  #     @confidence.skill_id = @skill.id
  #     @confidence.save
  #     # redirect_to '/skills/new'
  #   end
  #   # render 'new'
  # end

  def show
      @skill = Skill.find(params[:id])
      @skilldata = []
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
