class SurveysController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  load_and_authorize_resource

  before_filter :fetch_survey, only: %w(show edit update destroy participate)

  def participate
    question_ids = @survey.questions.map(&:id)

    if question_ids.present?
      session[:question_ids] = question_ids #move this in to memcache, instead of session
      question_id = session[:question_ids].delete_at 0
      redirect_to new_question_response_path(question_id), notice: 'Started Survey, please answer all your questions'
    else
      redirect_to :back, alert: 'There are no questions added in the survey'
    end
  end

  def index
    @surveys = SurveyDecorator.decorate_collection(Survey.all)
  end

  def show
    @survey = @survey.decorate
  end

  def new
    @survey = Survey.new
  end

  def edit
  end

  def create
    @survey = Survey.new(params[:survey])

    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end

  private
    def fetch_survey
      @survey = Survey.find(params[:id])
    end
end
