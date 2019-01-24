const FollowToggle = require("./follow_toggle");
const UsersSearch = require("./users_search");
const TweetCompose = require("./tweet_compose");

$(() => {
  const followToggleBtn = $("button.follow-toggle");
  followToggleBtn.each((idx, el) => {
    const $el = $(el);
    const followToggle = new FollowToggle($el);
  });

  $("nav.users-search").each((idx, el) => {
    new UsersSearch($(el));
  });

  new TweetCompose();
});