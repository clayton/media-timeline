class MediaTimeline.Views.SitesIndex extends Backbone.View

  template: JST['sites/index']

  initialize: ->
    @.collection.on 'reset', @.render, @

  render: ->
    context = data: @.collection.toJSON()
    $("#main").html @template context
