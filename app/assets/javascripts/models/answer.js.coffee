class MeaningAndPurpose.Models.Answer extends Backbone.Model
	urlRoot: '/answer'
	initialize: (question) ->
		this.set({'question': question})
	saveAnswer: ->
		this.save()