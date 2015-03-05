window.MeaningAndPurpose =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  State: {}
  initialize: -> 
    # console.log 'MeaningAndPurpose.initialize'
    this.router = new MeaningAndPurpose.Routers.Questions()
    unless Backbone.history.started
      Backbone.history.start({pushState: true})
      # console.log 'started history'
      Backbone.history.started = true

$(document).ready ->
  MeaningAndPurpose.initialize()
