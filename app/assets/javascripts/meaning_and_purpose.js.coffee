window.MeaningAndPurpose =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: (question_data) -> 
    # console.log 'MeaningAndPurpose.initialize'
    this.questions = new MeaningAndPurpose.Collections.Questions(question_data)
    this.router = new MeaningAndPurpose.Routers.Questions()
    unless Backbone.history.started
      Backbone.history.start()
      Backbone.history.started = true

$(document).ready ->
  MeaningAndPurpose.initialize(gon.questions)
