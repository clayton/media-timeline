class MediaTimeline.Views.Capture extends Backbone.View

  template: JST['captures/show']

  initialize: ->
    @model.on 'change', @.render, @

  render: ->
    context = capture: @model.toJSON()
    $("#main").html @template context