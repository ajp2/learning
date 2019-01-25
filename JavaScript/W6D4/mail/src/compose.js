const MessageStore = require("./message_store");

const Compose = {
  render() {
    const newDiv = document.createElement("div");
    newDiv.className = "new-message";
    newDiv.innerHTML = this.renderForm();

    newDiv.addEventListener("change", (event) => {
      const name = event.target.name;
      const value = event.target.value;
      MessageStore.updateDraftField(name, value);
    });

    newDiv.addEventListener("submit", (event) => {
      event.preventDefault();
      MessageStore.sendDraft();
      window.location.hash = "inbox";
    });

    return newDiv;
  },

  renderForm() {
    const draft = MessageStore.getMessageDraft();
    console.log(draft);
    const form = `
      <p class="new-message-header">New Message</p>
      <form class="compose-form">
        <input placeholder="Recipient" name="to" type="text" value=${draft.to}>
        <input placeholder="Subject" name="subject" type="text" value="${draft.subject}">
        <textarea name="body" rows=20>${draft.body}</textarea>
        <button type="submit" class="btn btn-primary submit-message">Send</button>
      </form>
    `;

    return form;
  }
};

module.exports = Compose;