(function () {
  "use strict";

  var tokBox = {
    token: gon.tok_token,
    otCore: null,
    publisherOptions: {
      insertMode: 'append',
      width: '100%',
      height: '100%'
    },
    init: function(otCore){
      this.otCore = otCore;
      this.session = otCore.initSession(gon.tok_api_key, gon.tok_session_id);
      tokBox.setup();
    },
    setup: function() {
      var targetElement =  document.getElementsByClassName('js-target-publisher')[0];
      var publisher = this.otCore.initPublisher(targetElement,this.publisherOptions);
      var self = this;

      self.session.on('streamCreated', function(event) {
        self.session.subscribe(event.stream);
      })
      .connect(this.token, function(event) {
        self.session.publish(publisher);
      });


    }
  };

  document.addEventListener('turbolinks:load', function () {
    if (typeof OT != "undefined") {
      tokBox.init(OT);
    }
  });

})();