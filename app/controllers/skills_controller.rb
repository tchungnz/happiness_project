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
    @user = current_user

      respond_to do |format|
        if @skill.save
          # Tell the UserMailer to send a welcome email after save
          UserMailer.new_skills(@user).deliver_now

          format.html { redirect_to(skill_path, notice: 'Skills were successfully created.') }
          format.json { render json: @user, status: :created, location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    redirect_to '/skills'
  end

  private

  def skills_params
    params.require(:skill).permit(:name, :confidence)
  end

end
