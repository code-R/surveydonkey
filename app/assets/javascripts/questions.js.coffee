$ ->
  options_with_new_lines = $("#question_option_names").text().replace(/;/g, '\r\n');
  $("#question_option_names").html(options_with_new_lines)

  showOrHideOptions($('#question_qtype').val())

  $('#question_qtype').change ->
    showOrHideOptions($(this).val())

  $('#question_parent_id').change ->
    $("#dependent-option").html('')
    question_id = $(this).val()
    if question_id
      $.getJSON "/questions/#{question_id}/options.json", (data) ->
        $("#dependent-option").append "<input type='checkbox' value='1' name='question[is_comparator]' class='boolean optional'> comparator <br/>"
        $.each data, (index, option) ->
          $("#dependent-options").append("<input type='radio' id='dependent_option_#{option.id}' name='question[dependent_option]' value='#{option.name}'>#{option.name}<br>")


showOrHideOptions = (question_type) ->
  return if question_type == undefined
  if question_type.contains('multiple_choice')
    $('#question-options').show()
  else
    $('#question-options').hide()