(function() {
  var $;

  $ = jQuery;

  $.fn.extend({
    pixelholder: function(options) {
      var log, settings;
      settings = {
        showDimensions: false,
        background: "#09c",
        text: "#fff",
        width: "500px",
        height: "500px",
        gradientStart: "#09c",
        gradientEnd: "#9c0",
        debug: false
      };
      settings = $.extend(settings, options);
      log = function(msg) {
        if (settings.debug) {
          return typeof console !== "undefined" && console !== null ? console.log(msg) : void 0;
        }
      };
      return this.each(function(index, element) {
        var $element, elementData, gradientEnd, gradientStart, height, width;
        $element = $(element);
        elementData = $element.data();
        element.style.display = "block";
        element.style.textAlign = "center";
        element.style.padding = 0;
        element.style.width = elementData.width ? elementData.width + "px" : settings.width;
        element.style.height = elementData.height ? elementData.height + "px" : settings.height;
        element.style.lineHeight = element.style.height;
        if (elementData.gradientstart || elementData.gradientend) {
          gradientStart = elementData.gradientstart || settings.gradientStart;
          gradientEnd = elementData.gradientend || settings.gradientEnd;
          if (elementData.gradientdirection === 'horizontal') {
            element.style.background = "linear-gradient(to right, " + gradientStart + ", " + gradientEnd + ")";
          } else {
            element.style.background = "linear-gradient(" + gradientStart + ", " + gradientEnd + ")";
          }
        } else {
          element.style.background = elementData.background || settings.background;
        }
        element.style.color = elementData.color || settings.text;
        if (elementData.showdimensions === true || settings.showDimensions) {
          width = parseInt(element.style.width);
          height = parseInt(element.style.height);
          return element.innerHTML = width + " x " + height + " px";
        }
      });
    }
  });

}).call(this);
