var HelloModel;
 
(function() {
 
    'use strict';
 
    HelloModel = Gillie.Model.extend({
 
        /**
        * Default attributes
        */
        defaults: {},
 
        /**
        * Base URL
        */
        url: 'http://dev.chez-syl.fr/gillietest',
 
        /**
        * Constructor
        */
        initialize: function() {
            return undefined;
        },
 
        /**
        * Sends a message
        *
        * @param object data
        * @return object
        */
        sendMessage: function(data) {
            /**
            * POST AJAX request
            */
            return this.Post('/message.php', 'message.send', { data: data });
        }
 
    });
 
    HelloModel = new HelloModel();
 
}());