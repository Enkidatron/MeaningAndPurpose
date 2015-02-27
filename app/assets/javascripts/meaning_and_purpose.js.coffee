window.MeaningAndPurpose =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  State: {}
  initialize: (question_data) -> 
    # console.log 'MeaningAndPurpose.initialize'
    this.State.questions = new MeaningAndPurpose.Collections.Questions(question_data)
    this.router = new MeaningAndPurpose.Routers.Questions()
    unless Backbone.history.started
      Backbone.history.start()
      # console.log 'started history'
      Backbone.history.started = true

$(document).ready ->
  MeaningAndPurpose.initialize(gon.questions)
