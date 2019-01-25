const MessageStore = require("./message_store");

const Inbox = {
  render() {
    const container = document.createElement("ul");
    container.className = "messages";
    
    const messages = MessageStore.getInboxMessages();
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
      <span class="from">${message.from}</span>
      <span class="subject">${message.subject}</span>
      <span class="body">${message.body}</span>
    `;

    return messageLi;
  }
};

module.exports = Inbox;