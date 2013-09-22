class SurveyDecorator < Draper::Decorator
  delegate_all

  def title_link
    h.link_to object.title, h.survey_path(object)
  end

  def truncated_description
    h.truncate(object.description)
  end
end
