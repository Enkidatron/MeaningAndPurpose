class AppController < ApplicationController
  before_action :authenticate_user!

  def home
  	@quiz = current_user.quiz
  	@questions = @quiz.questions
  	gon.rabl unless @questions.nil? or @quiz.nil?
  end
end
