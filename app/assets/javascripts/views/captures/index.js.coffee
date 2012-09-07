class MediaTimeline.Views.CapturesIndex extends Backbone.View

  template: JST['captures/index']

  initialize: ->
    @.collection.on 'reset', @.render, @

  render: ->
    context = data: @.collection.toJSON()
    $("#main").html @template context
