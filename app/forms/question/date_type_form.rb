class Question::DateTypeForm < QuestionForm
  validate :answer_by_date_type

  def input_type
    'date_picker'
  end

  private
    def answer_by_date_type
      Date.parse answer
    rescue ArgumentError
      errors.add(:answer, 'is not a date')
    end
end
