class QuestionDecorator < Draper::Decorator
  delegate_all

  def self.type_options_for_select
    Question::TYPES.inject([]) do |result, ele|
      humanized_question_type = I18n.t "questions.type.#{ele}"
      result << [humanized_question_type, ele]
    end
  end
end
