/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//alert("hello baka");

(function($){
  $.plugin('helloWorld',{
      
      defaults: {
        message: 'Hello World' 
      },
      
     init: function(){
         var me = this;
         
         me._on(me.$el, 'click', function(){
             console.log(me.opts.message);
         });
     } 
  });
  
  $('.shop-slogan').helloWorld();
  
})(jQuery);
