class MeaningAndPurpose.Routers.Questions extends Backbone.Router
	routes:
		"(/)(#)": "index"
	index: ->
		console.log 'router.index'
		pageView = new MeaningAndPurpose.Views.QuestionsIndex {}
		$('body').html(pageView.render().$el)
