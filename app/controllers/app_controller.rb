class AppController < ApplicationController
  def home
  	@questions = Question.all
  	gon.rabl unless @questions.nil?
  end
end
