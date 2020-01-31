/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * Today list:
 * -Überschreiben von Plugins angesehen & erstes Plugin überschrieben
 * -Einkaufswelten angesehen um Produkt Slider hinzu zufügen
 * -StateManager grob angesehen
 * 
 * State Manager States:
 * -xs = PHone portrait
 * -s = Phone landscape
 * -m = Tablet portrait
 * -l = Tablet landscape
 * -xl = Desktop
 */


(function ($){
    //Plugin erstellen:
    // $.Plugin()
    //Plugin überschreiben:
    // $.overridePlugin()

    
    $.overridePlugin('swProductSlider',{
        slide: function(){
            var me = this;
            //eigene Methode wird aufgerufen
            me.customMethod();
            //eigentliches Plugin wird wieder aufgerufen ... Im grunde das selbe wie $smarty.block.parent bloß in jQuery
            me.superclass.slide.apply(this, arguments);
        },
        
        customMethod: function(){
            var tick = new Date().toLocaleString();
            console.info("Slide Info: " + tick);
            
        }
    });
    
})(jQuery);