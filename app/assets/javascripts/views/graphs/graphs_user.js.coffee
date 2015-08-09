class MeaningAndPurpose.Views.GraphsUser extends Backbone.View

	template: '<div class="userGraph-container"></div>'
	render: ->
		# console.log 'GraphsUser View render'
		this.$el.html(this.template)
		pageFactory = React.createFactory(UserGraphPage)
		page = pageFactory
			collection:
				questions: MeaningAndPurpose.State.questions
			model:
				graph: MeaningAndPurpose.State.graph
# 			answerTexts: MeaningAndPurpose.State.user_text_data
		React.render(page, this.$('.userGraph-container').get(0))
		return this