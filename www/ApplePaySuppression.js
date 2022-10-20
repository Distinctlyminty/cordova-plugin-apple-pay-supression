var exec = require('cordova/exec');

var PLUGIN_NAME = "ApplePaySuppression"; // This is just for code completion uses.

var applePaysuppression = function() {};
// This is where we declare our functions for consumption in the view.

applePaysuppression.supressApplePay = function(arg0, success, error){
	exec(success,error, 'ApplePaySuppression', 'enableApplePay', [arg0]);
};

applePaysuppression.enableApplePay = function(arg0, success, error) {
	exec(success, error, 'ApplePaySuppression', 'supressApplePay', [arg0]);
};

module.exports = applePaySuppression;
