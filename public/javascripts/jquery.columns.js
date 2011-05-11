(function($){
    $.fn.equalHeights = function(){
        var max = 0;
        $(this).each(function(){
            if ($(this).height() > max) {
                max = $(this).height();
            }
        });
        if ($.browser.msie && $.browser.version == 6.0) {
            $(this).each(function() {
                $(this).css({
                    'height': max,
                    'min-height': max
                });
            });
        } else {
            $(this).each(function(){
                $(this).css({
                    'height': max
                });
            });
        }
    };
})(jQuery);