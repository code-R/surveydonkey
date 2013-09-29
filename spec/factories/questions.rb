FactoryGirl.define do
  factory :date_question, class: Question::DateType do
    description 'this is question description'
    humanized_question_type 'date'
    survey
  end
end
