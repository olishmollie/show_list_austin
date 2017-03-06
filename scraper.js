var cheerio = require('cheerio'),
    showList = require('./showList');

exports.scrape = function(callback) {
  showList.getHTML().then(function(html) {
    callback(html);
  }, function(error) {
    console.log(error);
  });
}
