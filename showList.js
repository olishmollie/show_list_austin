const request = require('tinyreq');

request('http://showlistaustin.com/', (err, body) => {
  console.log(err || body);
});
