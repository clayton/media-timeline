window.MediaTimeline =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    new MediaTimeline.Routers.Captures
    Backbone.history.start({pushState: true})

$(document).ready ->
  MediaTimeline.init()
