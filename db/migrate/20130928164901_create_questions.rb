class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :description
      t.string :type
      t.integer :survey_id

      t.timestamps
    end
  end
end
