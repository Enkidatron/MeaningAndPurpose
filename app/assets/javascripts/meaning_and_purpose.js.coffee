window.MeaningAndPurpose =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  State: {}
  initialize: (data) -> 
    # console.log 'MeaningAndPurpose.initialize'
    this.State.questions = new MeaningAndPurpose.Collections.Questions(data.questions)
    this.State.quiz = new MeaningAndPurpose.Models.Quiz(data.quiz)
    this.State.user_id = data.current_user.id
    this.router = new MeaningAndPurpose.Routers.Questions()
    unless Backbone.history.started
      Backbone.history.start()
      # console.log 'started history'
      Backbone.history.started = true

$(document).ready ->
  MeaningAndPurpose.initialize(gon)
