class QuestionDecorator < Draper::Decorator
  delegate_all

  def self.type_options_for_select
    Question::TYPES.inject([]) do |result, ele|
      humanized_question_type = I18n.t "questions.type.#{ele}"
      result << [humanized_question_type, ele]
    end
  end

  def edit_link
    h.link_to 'Edit', h.edit_survey_question_path(object.survey, object), class: info_class
  end

  def destroy_link
    h.link_to 'Destroy', object, method: :delete, data: { confirm: 'Are you sure?' }, class: danger_class
  end

  def description_with_number(index)
    "#{index + 1}) #{question_link}".html_safe
  end

  def required_status
    object.is_required? ? 'Required' : 'Optional'
  end

  def comparator_status

  end

  def dependent_question
    object.parent.try(:description) || not_available
  end

  def decorated_dependent_option
    object.dependent_option || not_available
  end

  def comparator_status
    if object.dependent_option.present?
      object.comparator? ? 'IS' : 'IS NOT'
    else
      not_available
    end
  end

  private
    def question_link
      (h.link_to object.description, h.question_path(object))
    end

    def not_available
      I18n.t "questions.NA"
    end

    def info_class
      %w(btn btn-mini btn-info)
    end

    def danger_class
      %w(btn btn-mini btn-danger)
    end
end
