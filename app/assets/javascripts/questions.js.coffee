$ ->
  updateQuestionOptionsData()
  showOrHideQuestionsOptions $('#question_qtype').val()
  showOrHideParentOptions $('#question_parent_id').val()

  $('#question_qtype').change ->
    showOrHideQuestionsOptions $(this).val()

  $('#question_parent_id').change ->
    $("#dependent-options").html('')
    showOrHideParentOptions $(this).val()

showOrHideQuestionsOptions = (question_type) ->
  return if question_type == undefined
  if question_type.contains('multiple_choice')
    $('#question-options').show()
  else
    $('#question-options').hide()

updateQuestionOptionsData = ->
  options_with_new_lines = $("#question_option_names").text().replace(/;/g, '\r\n');
  $("#question_option_names").html(options_with_new_lines)

showOrHideParentOptions = (question_id) ->
  if question_id
    $.getJSON "/questions/#{question_id}/options.json", (data) ->
      $("#dependent-options").append "<input type='checkbox' value='1' name='question[comparator]' class='boolean optional'> comparator <br/>"
      $.each data, (index, option) ->
        $("#dependent-options").append("<input type='radio' id='dependent_option_#{option.id}' name='question[dependent_option]' value='#{option.name}'>#{option.name}<br>")

