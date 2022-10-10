var exec = require('cordova/exec');


// This is where we declare our functions for consumption in the view.

exports.supressApplePay = function(arg0, success, error){
	exec(success,error, 'PasskitHelper', 'enableApplePay', [arg0]);
};

exports.enableApplePay = function(arg0, success, error) {
	exec(success, error, 'PasskitHelper', 'supressApplePay', [arg0]);
};

