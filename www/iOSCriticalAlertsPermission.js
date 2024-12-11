var exec = require('cordova/exec');

module.exports = {
	requestPermission: function(success, error) {
		exec(success, error, "iOSCriticalAlertsPermission", "requestPermission", []);
	}
};
