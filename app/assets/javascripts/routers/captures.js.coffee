class MediaTimeline.Routers.Captures extends Backbone.Router
  routes: {
    ":year-:month-:day-:hour" : "date",
    ":to_year-:to_month-:to_day-:to_hour/through/:from_year-:from_month-:from_day-:from_hour" : "through",
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

  through:(from_year, from_month, from_day, from_hour, to_year, to_month, to_day, to_hour) ->
    @.listView.collection.fetch(
        data:
          from_year: from_year
          from_month: from_month
          from_day: from_day
          from_hour: from_hour
          to_year: to_year
          to_month: to_month
          to_day: to_day
          to_hour: to_hour
          through: true
      )