class MeaningAndPurpose.Routers.Questions extends Backbone.Router
	routes:
		"(/)(#)(home)": "quiz"
	answerFactory: (question_id) ->
		answer = new MeaningAndPurpose.Models.Answer()
		answer.set({"question_id": question_id})
		answer
	quiz: ->
		# console.log 'router.quiz'
		MeaningAndPurpose.State.questions ?= new MeaningAndPurpose.Collections.Questions()
		MeaningAndPurpose.State.response = new MeaningAndPurpose.Models.Response()
		answerFactory = this.answerFactory
		answerModels = (answerFactory(question.get("id")) for question in MeaningAndPurpose.State.questions.models)
		MeaningAndPurpose.State.answers = new MeaningAndPurpose.Collections.Answers(answerModels)
		pageView = new MeaningAndPurpose.Views.QuestionsIndex {}
		$('body').html(pageView.render().$el)
