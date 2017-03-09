var ShowDay = require('../lib/showDay');

describe('ShowDay', function() {

  describe('attributes', function() {
    var showDay = new ShowDay('Monday, March 6, 2017', '<hr style="color:#cccccc;" />Julian Neel, Casey Golden, The Dan Ryan at <a href="http://www.hotelvegasaustin.com/"><b>Hotel Vegas</b></a> (1500 E. 6th St.) [<a href="cgi/genpage.cgi?venue=hotelvegas" title="list by venue">+</a>] <font color="#666666">[9pm]</font>');

    it('has a date', function() {
      var date = new Date('Monday, March 6, 2017');
      expect(showDay.date.setHours(0, 0, 0, 0).valueOf()).toEqual(date.valueOf());
    });

    it('has an html string of its shows', function() {
      expect(showDay.shows).toEqual('<hr style="color:#cccccc;" />Julian Neel, Casey Golden, The Dan Ryan at <a href="http://www.hotelvegasaustin.com/"><b>Hotel Vegas</b></a> (1500 E. 6th St.) [<a href="cgi/genpage.cgi?venue=hotelvegas" title="list by venue">+</a>] <font color="#666666">[9pm]</font>');
    });

  });
});
