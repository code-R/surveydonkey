class QuestionsController < ApplicationController
  load_and_authorize_resource

  before_filter :fetch_survey, only: [:new, :create, :edit, :update]
  before_filter :fetch_question, only: [:show, :edit, :destroy, :update, :options]

  def options
    render json: @question.options
  end

  def show

  end

  def new
    @survey   = Survey.find params[:survey_id]
    @question = @survey.questions.build
  end

  def create
    qtype = params[:question][:qtype]
    question_sti_klass = "Question::#{qtype.classify}Type".constantize
    @question = question_sti_klass.new(params[:question])

    if @question.save
      redirect_to @survey, notice: 'Question was successfully added.'
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    if @question.update_attributes(params[:question])
      redirect_to @survey, notice: 'Question was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @question.destroy

    redirect_to root_path , notice: 'Question was successfully destroyed.'
  end

  private
    def fetch_survey
      @survey = Survey.find params[:survey_id]
    end

    def fetch_question
      @question = QuestionDecorator.decorate Question.find(params[:id])
    end
end