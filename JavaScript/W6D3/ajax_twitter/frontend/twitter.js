const FollowToggle = require("./follow_toggle");

$(() => {
  const followToggleBtn = $("button.follow-toggle");
  followToggleBtn.each((idx, el) => {
    const $el = $(el);
    const followToggle = new FollowToggle($el);
  })
});