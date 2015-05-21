class MeaningAndPurpose.Views.AdminQuestions extends Backbone.View

	template: '<div class="MeaningAndPurpose-container"></div>'
	render: ->
		this.$el.html(this.template)
		pageFactory = React.createFactory(AdminQuestionsPage)
		page = pageFactory
			collection:
				questions: MeaningAndPurpose.State.questions
				quizzes: MeaningAndPurpose.State.quizzes
				questionships: MeaningAndPurpose.State.questionships
		React.render(page, this.$('.MeaningAndPurpose-container').get(0))
		return this
		