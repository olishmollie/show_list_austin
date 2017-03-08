var ShowDay = function(dateStr, shows) {
  this.date = new Date(dateStr); 
  this.shows = shows.replace(/^\n|\n$/g, '').split('\n');
}

module.exports = ShowDay;
