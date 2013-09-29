class SurveyDecorator < Draper::Decorator
  delegate_all

  def participate_link
    h.link_to 'Participate', h.participate_survey_path(object)
  end

  def title_link
    h.link_to object.title, h.survey_path(object)
  end

  def truncated_description
    h.truncate(object.description)
  end

  def edit_link
    h.link_to 'Edit', h.edit_survey_path(object), class: %w(btn btn-mini)
  end

  def destroy_link
    h.link_to 'Destroy', object, method: :delete, data: { confirm: 'Are you sure?' }, class: %w(btn btn-mini btn-danger)
  end
end
