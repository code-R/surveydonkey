class Question::NumberTypeForm < QuestionForm
  validates_numericality_of :answer

  def input_type
    'numeric'
  end
end

