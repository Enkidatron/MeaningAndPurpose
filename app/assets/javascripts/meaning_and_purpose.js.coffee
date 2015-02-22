window.MeaningAndPurpose =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> 
  	console.log 'MeaningAndPurpose.initialize'
  	this.router = new MeaningAndPurpose.Routers.Questions()
  	unless Backbone.history.started
  		Backbone.history.start()
  		Backbone.history.started = true

$(document).ready ->
  MeaningAndPurpose.initialize()
