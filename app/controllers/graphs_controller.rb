class GraphsController < ApplicationController
	before_action :authenticate_user!

	def user
		responses = current_user.responses
		@questions = responses.map{|r| r.quiz.questions}.flatten!.uniq!
		answerArray = @questions.map do |que| 
			responses.map do |r| 
				answer = Answer.where(response: r, question: que).first
				if answer.nil? then nil else answer.intAnswer end
			end
		end
		answerArray = answerArray.each_with_index.map{|a,i| ["Question #{i+1}"] + a}
		dateArray = ['x'] + responses.map{|r| r.created_at.strftime('%Y-%m-%d')}
		@data = [dateArray] + answerArray
		gon.rabl
	end
end
