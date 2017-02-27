var fs = require('fs');

var dir = 'webresources/libs/';
var sourceFile = "node_modules/lazysizes/lazysizes.min.js";
var targetFile = "webresources/libs/lazysizes.min.js";

if (!fs.existsSync(dir)){
    fs.mkdirSync(dir);
}
fs.writeFileSync(targetFile, fs.readFileSync(sourceFile));
