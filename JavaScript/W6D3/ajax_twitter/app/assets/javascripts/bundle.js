!function(t){var e={};function o(l){if(e[l])return e[l].exports;var n=e[l]={i:l,l:!1,exports:{}};return t[l].call(n.exports,n,n.exports,o),n.l=!0,n.exports}o.m=t,o.c=e,o.d=function(t,e,l){o.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:l})},o.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},o.t=function(t,e){if(1&e&&(t=o(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var l=Object.create(null);if(o.r(l),Object.defineProperty(l,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var n in t)o.d(l,n,function(e){return t[e]}.bind(null,n));return l},o.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return o.d(e,"a",e),e},o.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},o.p="",o(o.s=0)}([function(t,e,o){const l=o(1);$(()=>{$("button.follow-toggle").each((t,e)=>{const o=$(e);new l(o)})})},function(t,e,o){const l=o(2);t.exports=class{constructor(t){this.$el=t,this.followState=this.$el.data("initial-follow-state"),this.userId=this.$el.data("user-id"),this.render(),this.$el.on("click",this.handleClick.bind(this))}render(){let t;"followed"===this.followState?(t="Unfollow!",this.$el.prop("disabled",!1)):"unfollowed"===this.followState?(t="Follow!",this.$el.prop("disabled",!1)):"following"===this.followState?this.$el.prop("disabled",!0):"unfollowing"===this.followState&&this.$el.prop("disabled",!0),this.$el.text(t)}handleClick(t){t.preventDefault(),"followed"===this.followState?(this.followState="unfollowing",this.render(),l.unfollowUser(this.userId).then(()=>{this.followState="unfollowed",this.render()})):(this.followState="unfollowing",this.render(),l.followUser(this.userId).then(()=>{this.followState="followed",this.render()}))}}},function(t,e){const o={followUser:t=>$.ajax({type:"POST",url:`${t}/follow`,dataType:"json"}),unfollowUser:t=>$.ajax({type:"DELETE",url:`${t}/follow`,dataType:"json"})};t.exports=o}]);
//# sourceMappingURL=bundle.js.map