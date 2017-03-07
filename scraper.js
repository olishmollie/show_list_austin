const cheerio = require('cheerio'),
    showList = require('./showList');

exports.scrape = function(callback) {
  showList.getHTML(function(error, html) {
    if (error) { return callback(error) }
    
    return callback(null, html);
  });
}
