class MediaTimeline.Views.CapturesIndex extends Backbone.View

  template: JST['captures/index']

  initialize: ->
    @.collection.on 'reset', @.render, @

  render: ->
    context = captures: @.collection.toJSON()
    $("#main").html @template context
