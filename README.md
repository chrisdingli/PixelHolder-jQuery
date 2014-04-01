PixelHolder-jQuery
==================

jQuery plugin for creating placeholder images based on the [PixelHolder-RubyGem](http://github.com/chrisdingli/PixelHolder-RubyGem)

## Installation
Install via bower (or clone this git repository)

```
bower install pixelholder-jquery
```

Include jQuery and the plugin

```
<script src="jquery.js"></script>
<script src="pixelholder-jquery.js"></script>
```

Create `<i></i>` elements with appropriate data-tags (see example html file for usage examples)

```
<i class="pixelholder" data-width="300" data-height="600">PixelHolder</i>
```

Call PixelHolder

```
$(document).ready(function(){
  $(".pixelholder").pixelholder({
    showDimensions: false,
    background: "#09c",
    text: "#fff",
    width: "500px",
    height: "500px",
    gradientStart: "#09c",
    gradientEnd: "#9c0",
    debug: false
  });
});
```

Note: All options (excluding showDimensions) are used as default values if no data-value is applied to the `<i></i>` elements. showDimensions will override all placeholders and show dimensions on each placeholder.
