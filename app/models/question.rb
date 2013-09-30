class Question < ActiveRecord::Base
  attr_accessible :description, :survey_id, :humanized_question_type

  TYPES = %w(date number essay multiple_choice_radio_button)

  validates :description, :type, :survey_id, presence: true

  belongs_to :survey
  has_many :responses, dependent: :destroy

  def self.model_name
    ActiveModel::Name.new(self, nil, 'question')
  end

  #virtual attributes to handle question type
  def humanized_question_type
    if type.present?
      qtype = type.split("::").last[0..-5].underscore
      I18n.t("questions.type.#{qtype}")
    end
  end

  def humanized_question_type=(question_type)
    raise 'Should set Question Type' if question_type.nil?
    self.type = "Question::#{question_type.classify}Type"
  end
end
