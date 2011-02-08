// Taken from http://jquery-howto.blogspot.com/2009/05/jyoutube-jquery-youtube-thumbnail.html
// $.jYoutube('http://www.youtube.com/watch?v=rSUfWXcNAOw', 'small');
// $.jYoutube('http://www.youtube.com/watch?v=rSUfWXcNAOw', 'big');


$.extend({
  jYoutube: function( url, size ){
    if(url === null){ return ""; }

    size = (size === null) ? "small" : size;
    var vid;
    var results;

    results = url.match("[\\?&]v=([^&#]*)");

    vid = ( results === null ) ? url : results[1];

    if(size == "small"){
      return "http://img.youtube.com/vi/"+vid+"/2.jpg";
    }else {
      return "http://img.youtube.com/vi/"+vid+"/0.jpg";
    }
  }
});