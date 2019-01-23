const APIUtil = require('./api_util');

class FollowToggle {
  constructor($el, options) {
    this.$el = $el;
    this.followState = this.$el.data("initial-follow-state") ||
                      options.followState;
    this.userId = this.$el.data("user-id") || options.userId;

    this.render();
    this.$el.on("click", this.handleClick.bind(this));
  }

  render() {
    let text;
    if (this.followState === "followed") {
      text = "Unfollow!";
      this.$el.prop("disabled", false);
    } else if (this.followState === "unfollowed") {
      text = "Follow!";
      this.$el.prop("disabled", false);
    } else if (this.followState === "following") {
      this.$el.prop("disabled", true);
    } else if (this.followState === "unfollowing") {
      this.$el.prop("disabled", true);
    }

    this.$el.text(text);
  }

  handleClick(event) {
    event.preventDefault();

    if (this.followState === "followed") {
      this.followState = "unfollowing";
      this.render();

      APIUtil.unfollowUser(this.userId)
        .then(() => {
          this.followState = "unfollowed";
          this.render();
        });

    } else {
      this.followState = "unfollowing";
      this.render();

      APIUtil.followUser(this.userId)
        .then(() => {
          this.followState = "followed";
          this.render();
        });
    }
  }
}

module.exports = FollowToggle;