class AppController < ApplicationController
  before_action :authenticate_user!

  def home
  	@quiz = current_user.quiz
  	@quiz = Quiz.last if @quiz.nil?
  	@questions = @quiz.questions
  	gon.rabl unless @questions.nil? or @quiz.nil?
  end
end
