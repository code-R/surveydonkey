class MultipleChoiceRadioButtonInput < SimpleForm::Inputs::StringInput
  def input
    options = object.question.options
    build_html do
      ol do
        options.each_with_index do |option, index|
          li do
            div do
              span { @h.radio_button :question_response, :answer, option.name, class: 'multiple_choice_radio_button', id: "question_response_answer_choice_#{option.id}" }
              span option.name
            end
          end
        end
      end
    end
  end


  def build_html(assigns = {}, &blk)
    Mab::PrettyBuilder.new({h: template}.deep_merge(assigns), nil, &blk).to_s.html_safe
  end
end
