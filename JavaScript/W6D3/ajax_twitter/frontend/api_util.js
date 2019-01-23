const APIUtil = {
  followUser: id => {
    return $.ajax({
      type: "POST",
      url: `${id}/follow`,
      dataType: "json"
    });
  },

  unfollowUser: id => {
    return $.ajax({
      type: "DELETE",
      url: `${id}/follow`,
      dataType: "json",
    });
  }
};

module.exports = APIUtil;