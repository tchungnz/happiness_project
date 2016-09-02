class Skill < ApplicationRecord
  belongs_to :user
  has_many :confidences

  def self.base_skills
    @skill_names = ["Ruby", "Javascript", "HTML", "CSS", "Command Line", "Communication", "Project Work", "TDD", "Agile", "OOP", "Rails", "Databases", "ORM", "jQuery", "Version Control"]
  end


end
