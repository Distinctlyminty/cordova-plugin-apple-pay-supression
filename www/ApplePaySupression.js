var exec = require('cordova/exec');

var PLUGIN_NAME = "ApplePaySupression"; // This is just for code completion uses.

var applePaySupression = function() {};
// This is where we declare our functions for consumption in the view.

applePaySupression.supressApplePay = function(arg0, success, error){
	exec(success,error, 'ApplePaySupression', 'enableApplePay', [arg0]);
};

applePaySupression.enableApplePay = function(arg0, success, error) {
	exec(success, error, 'ApplePaySupression', 'supressApplePay', [arg0]);
};

module.exports = applePaySupression;
