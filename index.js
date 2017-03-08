const express = require('express');
const scraper = require('./scraper');

var app = express();

app.get('/shows/today', function(req, res) {
  scraper.scrapeShows(function(error, shows) {
    if (error) { 
      console.log(error);
      return;
    }

    var showsObj = JSON.parse(shows);
    var today = new Date().setHours(0, 0, 0, 0);
    var showToday;
    for (var i = 0; i < showsObj.length; i++) {
      var showDate = new Date(showsObj[i]['date']);
      if (today.valueOf() === showDate.valueOf()) {
        showToday = JSON.stringify(showsObj[i]);
        break;
      } else {
        showToday = JSON.stringify({ message: "No shows found for today" });
      }
    }

    res.write(showToday);
    res.end();
  });
});

app.listen(3000, function() {
  console.log('Listening on port 3000')
});
