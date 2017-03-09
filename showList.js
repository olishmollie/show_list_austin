const request = require('tinyreq');

exports.getHTML = function(callback) {
  request('http://showlistaustin.com', (error, body) => {
    if (error) { return callback(error) }

    return callback(null, body);
  });
}

