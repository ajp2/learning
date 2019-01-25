const MessageStore = require("./message_store");

const Sent = {
  render() {
    const container = document.createElement("ul");
    container.className = "messages";

    const messages = MessageStore.getSentMessages();
    messages.forEach(message => {
      const newNode = this.renderMessage(message);
      container.appendChild(newNode);
    });

    return container;
  },

  renderMessage(message) {
    const messageLi = document.createElement("li");
    messageLi.className = "message";
    messageLi.innerHTML = `
      <span class="to">${message.to}</span>
      <span class="subject">${message.subject}</span>
      <span class="body">${message.body}</span>
    `;

    return messageLi;
  }
};

module.exports = Sent;