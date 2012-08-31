class MediaTimeline.Routers.Captures extends Backbone.Router
  routes: {
    ":year/:month/:day/:hour" : "date",
    "" : "index"
  }

  initialize: ->
    @.listView = new MediaTimeline.Views.CapturesIndex
      collection: new MediaTimeline.Collections.Captures

  index: ->
    @.listView.collection.fetch(
      data:
        year: Date.today().getFullYear()
        month: Date.today().getMonth()
        day: Date.today().getDay()
        hour: Date.today().getHours()
    )

  date:(year, month, day, hour) ->
    @.listView.collection.fetch(
        data:
          year: year
          month: month
          day: day
          hour: hour
      )