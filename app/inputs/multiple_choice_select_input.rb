class MultipleChoiceSelectInput < SimpleForm::Inputs::StringInput
  def input
    options = object.question.options
    template.collection_select :question_response, :answer, options, :name, :name, prompt: true
  end

end
