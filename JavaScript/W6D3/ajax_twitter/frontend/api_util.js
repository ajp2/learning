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
  },

  searchUsers(queryVal, success) {
    $.ajax({
      type: "GET",
      url: "/users/search",
      dataType: "json",
      data: { query: queryVal },
      success,
      error: (xhr, ajaxOptions, err) => console.log("err")
    });
  }
};

module.exports = APIUtil;