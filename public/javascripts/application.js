jQuery(function($) {

  
  $('a.video-link').ytchromeless();

  
  
  
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