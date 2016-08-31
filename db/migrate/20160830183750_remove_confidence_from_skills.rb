class RemoveConfidenceFromSkills < ActiveRecord::Migration[5.0]
  def change
    remove_column :skills, :confidence
  end
end
