

module.exports = {
	enableApplePay: function(success, error){
		cordova.exec(success,error, 'ApplePaySuppression', 'enableApplePay');
	},

	disableApplePay: function(success, error) {
		cordova.exec(success, error, 'ApplePaySuppression', 'disableApplePay');
	}
};



