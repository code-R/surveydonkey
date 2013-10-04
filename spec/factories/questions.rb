FactoryGirl.define do
  factory :date_question, class: Question::DateType do
    description 'this is question description'
    qtype 'date'
    is_required true
    survey

    factory :number_question do
      qtype 'number'
    end

    factory :essay_question do
      qtype 'essay'
    end

    factory :multiple_choice_radio_button_question do
      qtype 'multiple_choice_radio_button'
    end
  end
end
