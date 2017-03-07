const cheerio = require('cheerio'),
    showList = require('./showList');

exports.scrape = function(callback) {
  showList.getHTML(function(error, html) {
    if (error) { return callback(error) }

    var $ = cheerio.load(html);

    var showsToday = $('.content').children('table').first();
    console.log(showsToday.text());
    
    return callback(null, showsToday.text());
  });
}
