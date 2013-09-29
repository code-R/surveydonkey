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

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = SurveyDecorator.decorate_collection(Survey.all)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    @survey = @survey.decorate

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/new
  # GET /surveys/new.json
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
        format.json { render json: @survey, status: :created, location: @survey }
      else
        format.html { render action: "new" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update_attributes(params[:survey])
        format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def fetch_survey
      @survey = Survey.find(params[:id])
    end
end
