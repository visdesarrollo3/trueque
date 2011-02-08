jQuery(function($) {

  $(".hide-not").click(function(){$(".notifications").fadeOut("normal"); return false;})
  
  $(".youtube").each(function(index, element){
    var _this = $(this);
    var _link = $("a.video", _this);
    alert(_link.attr("href"));
    var thumb_url = $.jYoutube(_link.attr("href"));
    _link.html('<img src="' + thumb_url + '" class="thumb bordered" />');
  });
  
  
  
  $('#slider').nivoSlider({
    effect:'fade', //Specify sets like: 'fold,fade,sliceDown'
    animSpeed: 500, //Slide transition speed
    pauseTime: 6000,
    startSlide: 0, //Set starting Slide (0 index)
    directionNav: true, //Next & Prev
    directionNavHide: true, //Only show on hover
    controlNav: true, //1,2,3...
    keyboardNav: true, //Use left & right arrows
    pauseOnHover: true, //Stop animation while hovering
    manualAdvance: false, //Force manual transitions
    captionOpacity: 0.8, //Universal caption opacity
    beforeChange: function(){},
    afterChange: function(){},
    slideshowEnd: function(){}, //Triggers after all slides have been shown
    lastSlide: function(){}, //Triggers when last slide is shown
    afterLoad: function(){} //Triggers when slider has loaded
  });

  function split( val ) {
    return val.split( /,\s*/ );
  }

  function extractLast( term ) {
    return split( term ).pop();
  }

  // if the function argument is given to overlay,
  // it is assumed to be the onBeforeLoad event listener
  $("a[rel='#overlay']").overlay({
    top: '10%',
    left: '25%',
    mask:{
      color:'#000',
      loadSpeed: 200,
      opacity: 0.9

    },
    onBeforeLoad: function() {
      var wrap = this.getOverlay().find(".contentWrap");
      wrap.load(this.getTrigger().attr("href"));
    }
  });
});