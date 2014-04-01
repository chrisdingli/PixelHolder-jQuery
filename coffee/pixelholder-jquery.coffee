# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
  # Change pluginName to your plugin's name.
  pixelholder: (options) ->
    # Default settings
    settings =
      showDimensions: false
      background: "#09c"
      text: "#fff"
      width: "500px"
      height: "500px"
      gradientStart: "#09c"
      gradientEnd: "#9c0"
      debug: false

    # Merge default settings with options.
    settings = $.extend settings, options

    # Simple logger
    log = (msg) ->
      console?.log msg if settings.debug

    # Run PixelHolder
    return @each (index, element) ->
      $element = $ element
      elementData = $element.data()

      element.style.display = "block"
      element.style.textAlign = "center"
      element.style.padding = 0
      element.style.width = if elementData.width then elementData.width + "px" else settings.width
      element.style.height = if elementData.height then elementData.height + "px" else settings.height
      element.style.lineHeight = element.style.height

      if elementData.gradientstart or elementData.gradientend
        gradientStart = elementData.gradientstart or settings.gradientStart
        gradientEnd = elementData.gradientend or settings.gradientEnd

        if elementData.gradientdirection == 'horizontal'
          element.style.background = "linear-gradient(to right, " + gradientStart + ", " + gradientEnd + ")"
        else
          element.style.background = "linear-gradient(" + gradientStart + ", " + gradientEnd + ")"
      else
        element.style.background = elementData.background or settings.background

      element.style.color = elementData.color or settings.text 

      if elementData.showdimensions == true or settings.showDimensions
        width = parseInt element.style.width
        height = parseInt element.style.height
        element.innerHTML = width + " x " + height + " px"
