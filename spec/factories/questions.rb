FactoryGirl.define do
  factory :date_question, class: Question::DateType do
    description 'this is question description'
    humanized_question_type 'date'
    survey

    factory :number_question do
      humanized_question_type 'number'
    end
  end
end
