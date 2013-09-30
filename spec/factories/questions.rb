FactoryGirl.define do
  factory :date_question, class: Question::DateType do
    description 'this is question description'
    humanized_question_type 'Date'
    survey

    factory :number_question do
      humanized_question_type 'Number'
    end

    factory :essay_question do
      humanized_question_type 'Essay'
    end

    factory :multiple_choice_radio_button do
      humanized_question_type 'multiple_choice_radio_button'
    end
  end
end
