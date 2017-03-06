const request = require('tinyreq');

exports.getHTML = function() {
  request('http://showlistaustin.com/', (err, body) => {
    console.log(err || body);
  });
}

