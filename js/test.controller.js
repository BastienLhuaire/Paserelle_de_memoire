var HelloController;
 
(function() {
 
    'use strict';
 
    HelloController = Gillie.Handler.extend({
 
        /**
        * Constructor
        */
        initialize: function() {
            return undefined;
        },
 
        /**
        * View events
        */
        events: {
            'submit #my_form': 'sendMessage'
        },
 
        /**
        * Sends a message
        *
        * @param object e
        * @return object
        */
        sendMessage: function(e) {
            e.preventDefault();
 
            /**
            * Query model
            */
            return HelloModel.sendMessage($(e.currentTarget).serialize());
        }
 
    });
 
    HelloController = new HelloController();
 
}());