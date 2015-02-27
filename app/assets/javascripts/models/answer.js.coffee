class MeaningAndPurpose.Models.Answer extends Backbone.Model
	urlRoot: '/answers'
	initialize: ->
		this.set("intAnswer": "5")
		this.set("textAnswer": "")
	saveAnswer: ->
		# console.log "save answer #{ this.get("intAnswer")} #{this.get("textAnswer")}"
		# console.log this
		this.save()