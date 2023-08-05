import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $("#message-container").append(data.text)
    function scroll_bottom(){
  if ($("#message").length > 0 ) {
    $("#message").scrollTop($("#message")[0].scrollHeight)
  }
}
    scroll_bottom();
    // Called when there's incoming data on the websocket for this channel
  }
});
