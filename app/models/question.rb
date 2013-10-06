class Question < ActiveRecord::Base
  attr_accessor :option_names

  attr_accessible :description, :survey_id, :qtype, :option_names, :is_required, :parent_id, :dependent_option, :comparator

  TYPES = %w(date number essay multiple_choice_radio_button multiple_choice_select)

  validates :description, :type, :survey_id, presence: true

  belongs_to :survey
  has_many :responses, dependent: :destroy

  has_ancestry

  scope :dependent_questions, lambda{ |answer| where(
    '(dependent_option = ? and comparator = ?)
    OR
    (dependent_option != ? and comparator = ?)', answer, true, answer, false) }

  def self.model_name
    ActiveModel::Name.new(self, nil, 'question')
  end

  def options
    []
  end

  def humanized_question_type
    I18n.t("questions.type.#{qtype}")
  end

  #virtual attributes to handle question type
  def qtype
    if type.present?
      qtype = type.split("::").last[0..-5].underscore
    end
  end

  def qtype=(question_type)
    raise 'Should set Question Type' if question_type.nil?
    self.type = "Question::#{question_type.classify}Type"
  end

  def required!
    self.is_required = true
    self.save
  end

  def optional!
    self.is_required = false
    self.save
  end

end