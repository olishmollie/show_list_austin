var Show = require('../lib/show');

describe('Show', function() {

  describe('attributes', function() {
    var show = new Show('Julian Neel, Casey Golden, The Dan Ryan at Hotel Vegas (1500 E. 6th St.) [+] [9pm]', 'Hotel Vegas');

    it('has a description', function() {
      expect(show.description).toEqual('Julian Neel, Casey Golden, The Dan Ryan at Hotel Vegas (1500 E. 6th St.) [+] [9pm]');
    });

    it('has a venue', function() {
      expect(show.venue).toEqual('Hotel Vegas'); 
    });
  });
});
