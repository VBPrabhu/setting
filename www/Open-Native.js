
var exec = require('cordova/exec');

module.exports = {
    openSettings: function(setvalue) {
        exec(null, null, "Settings", "openSettings", []);
    }
};