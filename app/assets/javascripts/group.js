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
      publisher.on({
        streamDestroyed: function (event) {
          console.log("Publisher stopped streaming. Reason: "
            + event.reason);
        }
      });

      var self = this.session;

      self.connect(this.token, function (error) {
        if (self.capabilities.publish == 1) {
          self.publish(publisher);
        } else {
          console.log("You cannot publish an audio-video stream.");
        }
      });
    }
  };

  document.addEventListener('turbolinks:load', function () {
    if (typeof OT != "undefined") {
      tokBox.init(OT);
    }
  });

})();