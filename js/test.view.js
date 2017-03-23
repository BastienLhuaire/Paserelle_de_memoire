var HelloView;
 
(function() {
 
    'use strict';
 
    var HelloView = Gillie.View.extend({
 
        /**
        * Constructor
        */
        initialize: function() {
            /**
            * Listener
            */
            HelloModel.on('message.send', this.messageSended);
        },
 
        /**
        * Callback message sended
        *
        * @param object model_instance
        * @param object json
        * @param object options
        */
        messageSended: function(model_instance, json, options) {
            if(options.xhr.status === 200) {
                $('#response').html(json.response);
            }
        }
 
    });
 
    HelloView = new HelloView();
 
}());