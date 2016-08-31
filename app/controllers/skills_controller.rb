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
<<<<<<< HEAD
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
=======
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
>>>>>>> bbd72d5b5b96e808bc02ce2d9a1498fbea09c4cb
  end

  private

  def skills_params
    params.require(:skill).permit(:name)
  end

  def confidence_params
    params.require(:confidence).permit(:rating)
  end

end
