
var exec = require('cordova/exec');

module.exports = {
    openNative: function(setvalue) {
        exec(null, null, "Settings", "openSettings", []);
    }
};