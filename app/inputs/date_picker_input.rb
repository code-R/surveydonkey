class DatePickerInput < SimpleForm::Inputs::StringInput
  def input_html_classes
    super << 'datepicker'
  end
end
