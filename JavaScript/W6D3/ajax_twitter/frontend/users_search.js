const APIUtil = require("./api_util");

class UsersSearch {
  constructor($el) {
    this.$el = $el;
    this.$input = $el.find("input");
    this.$ul = $el.find("ul.users");

    this.$input.on("input", this.handleInput.bind(this));
  }

  handleInput(event) {
    const inputVal = $(event.currentTarget).val();
    APIUtil.searchUsers(inputVal, this.renderResults.bind(this));
  }

  renderResults(results) {
    this.$ul.children().remove();
    results.forEach(result => {
      this.$ul.append($(`<li><a href="/users/${result.id}">${result.username}</a></li>`));
    });
  }
}

module.exports = UsersSearch;