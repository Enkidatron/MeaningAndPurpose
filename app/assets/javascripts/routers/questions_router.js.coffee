class MeaningAndPurpose.Routers.Questions extends Backbone.Router
	routes:
		"(/)(#)(home)": "quiz"
	answerFactory: (question_id) ->
		answer = new MeaningAndPurpose.Models.Answer()
		answer.set({"question_id": question_id})
		answer
	quiz: ->
		# console.log 'router.quiz'
		# Set Application State
		MeaningAndPurpose.State.quiz ?= new MeaningAndPurpose.Models.Quiz()
		MeaningAndPurpose.State.questions ?= new MeaningAndPurpose.Collections.Questions()
		# Match the response to the quiz
		MeaningAndPurpose.State.response = new MeaningAndPurpose.Models.Response()
		MeaningAndPurpose.State.response.set("quiz_id", MeaningAndPurpose.State.quiz.get("id"))
		MeaningAndPurpose.State.response.set("user_id", MeaningAndPurpose.State.user_id)
		# Create an answer for each question
		answerFactory = this.answerFactory
		answerModels = (answerFactory(question.get("id")) for question in MeaningAndPurpose.State.questions.models)
		MeaningAndPurpose.State.answers = new MeaningAndPurpose.Collections.Answers(answerModels)
		# Make the Quiz view
		pageView = new MeaningAndPurpose.Views.QuestionsIndex {}
		$('body').html(pageView.render().$el)
