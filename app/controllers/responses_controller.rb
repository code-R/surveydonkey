class ResponsesController < ApplicationController
  load_and_authorize_resource

  before_filter :fetch_question, only: %w(new create)

  def index
    @survey = Survey.find params[:survey_id]
  end

  def new
    form_klass = "Question::#{@question.humanized_question_type}TypeForm".constantize
    @answer_form = form_klass.new(@question, current_user)
  end

  def create
    @response = Response.new(params[:response])

    if @response.save
      if session[:question_ids].present?
        next_question_id = session[:question_ids].delete_at 0
        redirect_to new_question_response_path(next_question_id)
      else
        redirect_to root_path, :notice => 'Survey is completed.'
      end
    else
      render action: 'new'
    end
  end

  private
    def fetch_question
      @question = Question.find params[:question_id]
    end
end