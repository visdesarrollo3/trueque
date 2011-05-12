var nivo_options = {
    effect:'fade', //Specify sets like: 'fold,fade,sliceDown'
    animSpeed: 500, //Slide transition speed
    pauseTime: 9000,
    startSlide: 0, //Set starting Slide (0 index)
    directionNav: true, //Next & Prev
    directionNavHide: true, //Only show on hover
    controlNav: false, //1,2,3...
    keyboardNav: true, //Use left & right arrows
    pauseOnHover: true, //Stop animation while hovering
    manualAdvance: false, //Force manual transitions
    captionOpacity: 0.8, //Universal caption opacity
    beforeChange: function(){},
    afterChange: function(){},
    slideshowEnd: function(){}, //Triggers after all slides have been shown
    lastSlide: function(){}, //Triggers when last slide is shown
    afterLoad: function(){} //Triggers when slider has loaded
}

var hide_notifications = function(){
  $(".notifications").fadeOut("normal"); return false;
}

var max = function(a, b){
  if(a > b) return a;
  return b;
}

var make_content_equal_height = function(){
  var _content = jQuery("#main-content");
  var _sidebar = jQuery("#sidebar");
  var height = max(_content.outerHeight(true) + 50, _sidebar.outerHeight(true) + 50);
  _content.css('min-height', height);
  _sidebar.css('min-height', height);
}

jQuery(function($) {

  make_content_equal_height();

  $(".hide-not").live('click', hide_notifications);
  
  $(".youtube").each(function(index, element){
    var _this = $(this);
    var _span = $("span", _this);
    var _link = $("a.video", _this);
    var thumb_url = $.jYoutube(_span.html(), "big");
    _link.html('<img src="' + thumb_url + '" class="thumb bordered" />');
  });
  
  
  $("iframe").wrap("<div class='iframe-wrapper' style='text-align: center; padding: 10px 0px 20px;' />");
  
  
  $('#slider').nivoSlider(nivo_options);
  
  

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
      opacity: 0.8
    },
    onBeforeLoad: function() {
      var wrap = this.getOverlay().find(".contentWrap");
      var slider = this.getOverlay().find(".slider");
      slider.show();
      wrap.hide().load(this.getTrigger().attr("href"), function(){
        slider.hide();
        wrap.show();
      });
    }
  });
});