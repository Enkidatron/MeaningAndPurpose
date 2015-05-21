window.MeaningAndPurpose =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  State: {}
  initialize: -> 
    # console.log 'MeaningAndPurpose.initialize'
    this.router = new MeaningAndPurpose.Routers.Router()
    unless Backbone.history.started
      Backbone.history.start({pushState: true})
      # console.log 'started history'
      Backbone.history.started = true
      $(document).on('click','a:not([data-bypass])', (e) ->
        href = $(this).attr('href')
        protocol = this.protocol + '//'
        if href.slice(protocol.length) != protocol
          e.preventDefault()
          MeaningAndPurpose.router.navigate(href, true)          
        
      )

$(document).ready ->
  MeaningAndPurpose.initialize()
