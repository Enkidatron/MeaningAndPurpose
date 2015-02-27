class MeaningAndPurpose.Models.Response extends Backbone.Model
	urlRoot: '/responses'
	saveAllAndRefresh: ->
		# console.log 'response.saveResponse'
		# console.log this
		this.answers = MeaningAndPurpose.State.answers
		this.save(null, {success: this.saveAnswersAndRefresh})
	saveAnswersAndRefresh: (model, response) ->
		# console.log 'response.saveAnswers'
		model.answers.saveAnswers(model.get("id"))
		model.answers = null
		Backbone.history.loadUrl( Backbone.history.fragment )
