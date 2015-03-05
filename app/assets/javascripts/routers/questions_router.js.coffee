class MeaningAndPurpose.Routers.Questions extends Backbone.Router
	routes:
		"(#)graphs(/user)(/)": "user_graph"
		"(#)": "quiz"
	quiz: ->
		console.log 'router.quiz'
		# Set Application State
		# Get user_id, Quiz, and Questions from gon
		MeaningAndPurpose.State.questions = new MeaningAndPurpose.Collections.Questions(gon.questions)
		MeaningAndPurpose.State.quiz = new MeaningAndPurpose.Models.Quiz(gon.quiz)
		MeaningAndPurpose.State.user_id = gon.current_user.id
		# Match the response to the quiz
		MeaningAndPurpose.State.response = new MeaningAndPurpose.Models.Response()
		MeaningAndPurpose.State.response.set("quiz_id", MeaningAndPurpose.State.quiz.get("id"))
		MeaningAndPurpose.State.response.set("user_id", MeaningAndPurpose.State.user_id)
		# Create an answer for each question
		answerFactory = (question_id) ->
			answer = new MeaningAndPurpose.Models.Answer()
			answer.set({"question_id": question_id})
			answer
		answerModels = (answerFactory(question.get("id")) for question in MeaningAndPurpose.State.questions.models)
		MeaningAndPurpose.State.answers = new MeaningAndPurpose.Collections.Answers(answerModels)
		# Make the Quiz view
		pageView = new MeaningAndPurpose.Views.QuestionsIndex {}
		$('body').html(pageView.render().$el)
	user_graph: ->
		console.log 'router.user_graph'
		userGraphView = new MeaningAndPurpose.Views.GraphsUser {}
		$('body').html(userGraphView.render().$el)
		userGraphView.renderChart()
		