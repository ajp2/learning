const APIUtil = require("./api_util");

class TweetCompose {
  constructor() {
    this.$el = $(".tweet-compose");

    this.$el.on("submit", this.submit.bind(this));
    this.$el.find("textarea").on("input", (event) => {
      let charsLeft = 140 - $(event.currentTarget).val().length;
      $(".chars-left").text(charsLeft);
    });

    $(".add-mention").on("click", this.newUserSelect.bind(this));
  }

  submit(event) {
    event.preventDefault();
    const data = $(event.currentTarget).serializeJSON();
    $(event.currentTarget).find(":input").prop("disabled", true);

    APIUtil.createTweet(data)
      .then(this.handleSuccess.bind(this));
  }

  clearInput() {
    this.$el.find("textarea").val("");
    this.$el.find("select option").removeAttr("selected");
  }

  handleSuccess(result) {
    this.clearInput();
    this.$el.find(":input").prop("disabled", false);

    const ulId = this.$el.data("tweets-ul");
    const $li = $(`<li>${JSON.stringify(result)}</li>`);
    $(ulId).prepend($li);
  }

  newUserSelect(event) {
    event.preventDefault();
    
    const userSelect = $("<select>").attr("name", "tweet[mentioned_user_ids][]");
    userSelect.append($("<option>"));

    window.users.forEach(user => {
      userSelect.append($("<option>", {
        value: user.id,
        text: user.username
      }));
    });

    const $label = $("<label>").text("Mention ");

    $(".add-select").append(userSelect, $("<br>"));
  }
}

module.exports = TweetCompose;