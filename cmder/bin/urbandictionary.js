var http  = require('http');

var colourEscape = '\033[1;36m';

http.request({
  hostname: 'api.urbandictionary.com',
  path: '/v0/random'
}, function (res) {
  var data = '';

  res.on('data', function (chunk) {
    data += chunk;
  });

  res.on('end', function () {
    var results   = JSON.parse(data);
    var result    = results.list[0];
    var line      = '';

    if (result) {
      for (var i = 0; i < result.word.length; i++) { line+='-'; }
      console.log(colourOutput(line));
      console.log(colourOutput(result.word));
      console.log(colourOutput(line));
      console.log(colourOutput(result.definition));
    }

  });

}).end();

function colourOutput (input) {
  return colourEscape + input + '\033[0m';
}
