import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";

// Connects to data-controller="chatroom-subscription"
export default class extends Controller {
  static values = { chatroomId: Number };
  static targets = ["messages"];

  connect() {
    console.log(this.messagesTarget);
    this.channel = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      {
        received: (data) => {
          // We should receive messages here, then insert into the HTML
          console.log(data);
          this.messagesTarget.insertAdjacentHTML("beforeend", data);
          this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);
        },
      }
    );
  }

  resetForm(event) {
    // this will clear the form that was submitted
    event.target.reset();
  }
}
