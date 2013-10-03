FactoryGirl.define do
  factory :option do
    sequence :name do |n|
      "choice #{n}"
    end

    question do
      create(:multiple_choice_radio_button_question)
    end
  end
end
