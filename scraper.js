const cheerio = require('cheerio'),
      showList = require('./showList'),
      Show = require('./lib/show');

exports.scrape = function(callback) {
  showList.getHTML(function(error, html) {
    if (error) { return callback(error) }

    var page = cheerio.load(html);

    return callback(null, 'yup');
  });
}
