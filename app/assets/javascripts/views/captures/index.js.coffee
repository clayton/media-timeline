class MediaTimeline.Views.CapturesIndex extends Backbone.View

  template: JST['captures/index']

  initialize: ->
    @collection.on 'reset', @.render, @
    @bind_scroll_detector()

  render: ->
    context = data: @.collection.toJSON()
    $("#main").html @template context

  bind_scroll_detector: =>
    $(window).scroll (e) =>
      if $(document).height() - 200 < $(document).scrollTop() + $(window).height()
        @scroll_window()

  load_next_hour: =>

  scroll_window: (e) =>
    @load_next_hour()