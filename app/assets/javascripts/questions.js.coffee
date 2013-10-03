$ ->
  showOrHideOptions($('#question_humanized_question_type').val())

  $('#question_humanized_question_type').change ->
    showOrHideOptions($(this).val())


showOrHideOptions = (question_type) ->
  return if question_type == undefined
  if question_type.contains('multiple_choice')
    $('#question-options').show()
  else
    $('#question-options').hide()