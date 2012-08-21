window.MediaTimeline =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    console.log "init"
    new MediaTimeline.Routers.Sites
    Backbone.history.start()

$(document).ready ->
  MediaTimeline.init()
