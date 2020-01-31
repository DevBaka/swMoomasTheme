(function ($, window){
   
   $window = $(window);
   
   $.plugin('swScrollNavigation', {
       defaults: {
           showPosition: 200,
           scrollCls: 'scroll-nav',
           activeCls: 'is--active'
       },
       init: function(){
           var me = this;
           me.applyDataAttributes();
           me.createElement();
           me.registerEvents();
       },
       
       createElement: function(){
           var me = this;
           me.$nav = me.$el.clone(true, true);
           me.$nav.addClass(me.opts.scrollCls).appendTo('body');
       },
       
       registerEvents: function(){
           var me = this;
           me._on($window, 'scroll', $.proxy(me.onScroll, me));
       },
       onScroll: function(){
           var me = this;
           
           if($window.scrollTop() < me.opts.showPosition){
               me.$nav.removeClass(me.opts.activeCls);
               return;
           }
           me.$nav.addClass(me.opts.activeCls);
       },
       
       destroy: function(){
           var me = this;
           me.$nav.remove();
           me._destroy();
       }
       
   });
   
})(jQuery, window);

(function($, window){
    window.StateManager.addPlugin('*[data-scroll-nav="true"]', 'swScrollNavigation', ['m', 'l', 'xl']);
})(jQuery, window);