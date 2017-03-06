var express = require('express');
var showList = require('./showList');

var app = express();

app.get('/', function(req, res) {
  showList.getHTML();
  res.send('Hello Show List Austin!');
});

app.listen(3000, function() {
  console.log('Listening on port 3000')
});
