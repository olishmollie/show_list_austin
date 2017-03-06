const request = require('tinyreq');

exports.getHTML = function() {
  return new Promise((resolve, reject) => {
    request('http://showlistaustin.com/', (err, body) => {
      if (err) { 
        reject(err);
      } else {
        resolve(body);
      }
    });
  });
}

