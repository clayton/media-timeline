class MediaTimeline.Routers.Captures extends Backbone.Router
  routes: {
    ":year-:month-:day-:hour" : "date",
    ":to_year-:to_month-:to_day-:to_hour/through/:from_year-:from_month-:from_day-:from_hour" : "through",
    "" : "index"
  }

  initialize: ->
    @route(/^[\d,-]+\/[a-z,-]+\/(\d+)$/, "show")
    @collection = new MediaTimeline.Collections.Captures

  index: ->
    @listView = new MediaTimeline.Views.CapturesIndex
      collection: @collection
    @listView.collection.fetch()

  show:(id) ->
    @captureView = new MediaTimeline.Views.Capture
      model: new MediaTimeline.Models.Capture(id: id)
    @captureView.model.fetch()

  date:(year, month, day, hour) ->
    @listView = new MediaTimeline.Views.CapturesIndex
      collection: @collection
    @listView.collection.fetch(
        data:
          year: year
          month: month
          day: day
          hour: hour
      )

  through:(from_year, from_month, from_day, from_hour, to_year, to_month, to_day, to_hour) ->
    @listView = new MediaTimeline.Views.CapturesIndex
      collection: @collection
    @listView.collection.fetch(
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