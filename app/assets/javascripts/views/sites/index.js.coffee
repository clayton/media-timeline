class MediaTimeline.Views.SitesIndex extends Backbone.View

  template: JST['sites/index']

  initialize: ->
    @.collection.on 'reset', @.render, @

  render: ->
    context = sites: @.collection.toJSON()
    console.log(context)
    $("#main .container").html @template context
