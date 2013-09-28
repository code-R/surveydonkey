class QuestionsController < ApplicationController
  load_and_authorize_resource

  before_filter :fetch_survey, only: [:new, :create]

  def new
    @survey   = Survey.find params[:survey_id]
    @question = @survey.questions.build
  end

  def create
    @question = Question.new(params[:question])

    if @question.save
      redirect_to @survey, notice: 'Question was successfully added.'
    else
      render action: 'new'
    end
  end

  private
    def fetch_survey
      @survey = Survey.find params[:survey_id]
    end
end