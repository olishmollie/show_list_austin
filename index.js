const express = require('express');
const scraper = require('./scraper');

var app = express();

app.get('/', function(req, res) {
  scraper.scrape(function(error, html) {
    if (error) { 
      console.log(error);
      return;
    }
    res.send(html);
  });
});

app.listen(3000, function() {
  console.log('Listening on port 3000')
});
