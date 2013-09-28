class Question < ActiveRecord::Base
  attr_accessible :description, :survey_id, :humanized_question_type

  TYPES = %w(date)

  validates :description, :type, :survey_id, presence: true

  belongs_to :survey

  #virtual attributes to handle question type
  def humanized_question_type
    type.split("::").last[0..-5] if type.present?
  end

  def humanized_question_type=(question_type)
    raise 'Should set Question Type' if question_type.nil?
    self.type = "Question::#{question_type.classify}Type"
  end
end
