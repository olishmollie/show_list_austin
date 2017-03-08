const cheerio = require('cheerio'),
      showList = require('./showList'),
      ShowDay = require('./lib/showDay');

exports.scrapeShows = function(callback) {
  showList.getHTML(function(error, html) {
    if (error) { return callback(error) }

    var $ = cheerio.load(html);

    var dates = $('table', '.content');

    var datesArr = dates.map(function(index, element) {
      var date = $(this).prev().text().replace(/\[link\]/, '');
      return new ShowDay(date, $(this).text());
    }).toArray();

    var showDays = JSON.stringify(datesArr);

    return callback(null, showDays);
  });
}
