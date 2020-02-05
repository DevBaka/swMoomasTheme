(function() {
    $.overridePlugin('swDropdownMenu', {
        onClickMenu: function (event) {
            var me = this;
            debugger;
            // || event.target.tagName === 'BUTTON'
            if (event.target.tagName === 'INPUT' || event.target.tagName === 'BUTTON') {
                console.log("BUTTON PRESSED");
                event.preventDefault();
                return;
            }

            me.applyDataAttributes();
            if ($(event.target).is(me.opts.blockedElements)) {
                return;
            }

            if (me.opts.preventDefault) {
                event.preventDefault();
            }

            if(jQuery.inArray("account--display")){
                console.log("SPAN account link PRESSED");
                me.$el.toggleClass(me.opts.activeCls);
            }
            if(event.target.className === 'btn is--icon-left entry--link account--link account--user-loggedin'){
                console.log("SPAN PRESSED");
                //toggleClass durch addClass changensetzen
                me.$el.toggleClass(me.opts.activeCls);
            }
            if (me.opts.closeOnBody) {
                event.stopPropagation();
                $('body').on(me.getEventName('touchstart click'), $.proxy(me.onClickBody, me));
            }

            $.publish('plugin/swDropdownMenu/onClickMenu', [ me, event ]);
        },

        onClickBody: function(event) {
            var me = this;

            if (event.target.tagName === 'INPUT' || event.target.tagName === 'BUTTON') {
                event.preventDefault();
                return;
            }

            if ($(event.target).is(me.opts.blockedElements)) {
                return;
            }

            event.preventDefault();

            $('body').off(me.getEventName('touchstart click'));

            me.$el.removeClass(me.opts.activeCls);

            $.publish('plugin/swDropdownMenu/onClickBody', [ me, event ]);
        }
    });
})();