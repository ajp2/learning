/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

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
  },

  createTweet(data) {
    return $.ajax({
      type: "POST",
      url: "/tweets",
      dataType: "json",
      data
    });
  }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

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

/***/ }),

/***/ "./frontend/tweet_compose.js":
/*!***********************************!*\
  !*** ./frontend/tweet_compose.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

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

/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search */ "./frontend/users_search.js");
const TweetCompose = __webpack_require__(/*! ./tweet_compose */ "./frontend/tweet_compose.js");

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

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

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

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map