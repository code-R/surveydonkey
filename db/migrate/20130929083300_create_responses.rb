class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.text :answer
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end