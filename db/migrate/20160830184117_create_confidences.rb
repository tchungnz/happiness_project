class CreateConfidences < ActiveRecord::Migration[5.0]
  def change
    create_table :confidences do |t|
      t.integer :rating
      t.integer :skill_id

      t.timestamps
    end
  end
end
