class QuestionsController < ApplicationController
  load_and_authorize_resource

  def new
    @survey   = Survey.find params[:survey_id]
    @question = @survey.questions.build
  end

end