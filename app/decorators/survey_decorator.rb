class SurveyDecorator < Draper::Decorator
  delegate_all

  def participate_link
    h.link_to 'Participate', h.participate_survey_path(object), class: success_class
  end

  def title_link
    h.link_to object.title, h.survey_path(object)
  end

  def truncated_description
    h.truncate(object.description)
  end

  def edit_link
    h.link_to 'Edit', h.edit_survey_path(object), class: info_class
  end

  def destroy_link
    h.link_to 'Destroy', object, method: :delete, data: { confirm: 'Are you sure?' }, class: danger_class
  end

  def all_responses_link
    h.link_to 'View all responses', h.survey_responses_path(object), class: info_class
  end

  def add_question_link
    h.link_to 'Add Question', h.new_survey_question_path(object), class: info_class
  end

  private
    def success_class
      %w(btn btn-mini btn-success)
    end

    def info_class
      %w(btn btn-mini btn-info)
    end

    def danger_class
      %w(btn btn-mini btn-danger)
    end
end
