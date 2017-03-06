var express = require('express');
var scraper = require('./scraper');

var app = express();

app.get('/', function(req, res) {
  scraper.scrape(function(html) {
    res.send(html);
  });
});

app.listen(3000, function() {
  console.log('Listening on port 3000')
});
