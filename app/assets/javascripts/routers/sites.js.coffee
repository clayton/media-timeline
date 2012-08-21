class MediaTimeline.Routers.Sites extends Backbone.Router
  routes: {
    "" : "index"
  }

  initialize: ->
    console.log("initialize")
    @.list = new MediaTimeline.Collections.Sites()
    @.list.fetch()

  index: ->
    listView = new MediaTimeline.Views.SitesIndex({
        collection: @.list
      })