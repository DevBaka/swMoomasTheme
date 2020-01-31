(function($, window){
    
    $.overridePlugin("swAddArticle", {
        sendSerializedForm: function(){
            var me = this;
            me.opts.showModal = false;
            
            me.superclass.sendSerializedForm.apply(this, arguments);
        }
    }),
    
    $.subscribe('plugin/swAddArticle/onAddArticle', function(event, plugin){
        var $cartBtn = $('.entry--cart');
        plugin.opts.showModal = false;
        $.loadingIndicator.close();
        
        $cartBtn.addClass('rumble');
        
        window.setTimeout(function(){
            $cartBtn.removeClass('rumble');
        }, 3000);
    });
})(jQuery, window);
