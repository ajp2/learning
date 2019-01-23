const APIUtil = require("./api_util");
const FollowToggle = require("./follow_toggle");

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
      const $li = $(`<li><a href="/users/${result.id}">${result.username}</a></li>`);
      const $btn = $("<button>");
      new FollowToggle($btn, { 
          userId: result.id, 
          followState: result.followed ? "followed" : "unfollowed"
        });
      $li.append($btn)

      this.$ul.append($li);
    });
  }
}

module.exports = UsersSearch;