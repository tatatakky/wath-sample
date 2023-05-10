var express = require("express");
const path = require('path');
var app = express();

app.get("/wath_sample", function(req, res, next){
	console.log(req.url);
	res.set({'Content-Type': 'text/html'});
	res.sendFile(path.join(__dirname, '../public/index.html'));
});

app.get("/wath_sample/wasm/wath.wasm", (req, res) => {
	console.log(req.url);
	res.setHeader('Content-Type', 'application/wasm');
	res.sendFile(path.join(__dirname, '../public/wasm/wath.wasm'));
});

var server = app.listen(3060, function(){
	console.log("Node.js Listen PORT: " + server.address().port);
});
