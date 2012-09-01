class MediaTimeline.Routers.Captures extends Backbone.Router
  routes: {
    ":year/:month/:day/:hour" : "date",
    "" : "index"
  }

  initialize: ->
    @.listView = new MediaTimeline.Views.CapturesIndex
      collection: new MediaTimeline.Collections.Captures

  index: ->
    @.listView.collection.fetch()

  date:(year, month, day, hour) ->
    @.listView.collection.fetch(
        data:
          year: year
          month: month
          day: day
          hour: hour
      )