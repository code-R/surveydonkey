class QuestionsController < ApplicationController
  load_and_authorize_resource

  before_filter :fetch_survey, only: [:new, :create, :edit]
  before_filter :fetch_question, only: [:edit, :destroy]

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

  def edit

  end

  def destroy
    @question.destroy

    redirect_to :back, notice: 'Survey was successfully destroyed.'
  end

  private
    def fetch_survey
      @survey = Survey.find params[:survey_id]
    end

    def fetch_question
      @question = Question.find(params[:id])
    end
end