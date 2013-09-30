class QuestionDecorator < Draper::Decorator
  delegate_all

  def self.type_options_for_select
    %w(date number)
    Question::TYPES.inject([]) do |result, ele|
      result << [ele.titleize, ele]
    end
  end
end
