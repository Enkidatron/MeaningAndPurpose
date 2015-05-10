class GraphsController < ApplicationController
	before_action :authenticate_user!

	def user
		responses = current_user.responses
		unless responses.nil? or responses.length == 0
			@questions = responses.map{|r| r.quiz.questions}.flatten!.uniq!
			answerArray = @questions.map do |que| 
				responses.map do |r| 
					answer = Answer.where(response: r, question: que).first
					if answer.nil? then nil else [answer.intAnswer, answer.textAnswer] end
				end
			end
			intAnswerArray = answerArray.each_with_index.map{|aa,i| ["Question #{i+1}"] + aa.map{|a| a[0] unless a.nil?}}
			textAnswerArray = answerArray.map{|aa| aa.map{|a| a[1] unless a.nil?}}
			dateArray = ['x'] + responses.map{|r| r.created_at.strftime('%Y-%m-%d')}
			@data = [dateArray] + intAnswerArray
			@textData = textAnswerArray
		end
		gon.rabl
	end
end
