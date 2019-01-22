!function(t){var e={};function n(o){if(e[o])return e[o].exports;var r=e[o]={i:o,l:!1,exports:{}};return t[o].call(r.exports,r,r.exports,n),r.l=!0,r.exports}n.m=t,n.c=e,n.d=function(t,e,o){n.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:o})},n.r=function(t){"undefined"!=typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},n.t=function(t,e){if(1&e&&(t=n(t)),8&e)return t;if(4&e&&"object"==typeof t&&t&&t.__esModule)return t;var o=Object.create(null);if(n.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var r in t)n.d(o,r,function(e){return t[e]}.bind(null,r));return o},n.n=function(t){var e=t&&t.__esModule?function(){return t.default}:function(){return t};return n.d(e,"a",e),e},n.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},n.p="",n(n.s=0)}([function(t,e,n){const o=n(1),r=n(2);$(()=>{const t=$(".hanoi"),e=new o;new r(e,t)})},function(t,e){t.exports=class{constructor(){this.towers=[[3,2,1],[],[]]}isValidMove(t,e){const n=this.towers[t],o=this.towers[e];return 0!==n.length&&(0==o.length||n[n.length-1]<o[o.length-1])}isWon(){return 3==this.towers[2].length||3==this.towers[1].length}move(t,e){return!!this.isValidMove(t,e)&&(this.towers[e].push(this.towers[t].pop()),!0)}print(){console.log(JSON.stringify(this.towers))}promptMove(t,e){this.print(),t.question("Enter a starting tower: ",n=>{const o=parseInt(n);t.question("Enter an ending tower: ",t=>{const n=parseInt(t);e(o,n)})})}run(t,e){this.promptMove(t,(n,o)=>{this.move(n,o)||console.log("Invalid move!"),this.isWon()?(this.print(),console.log("You win!"),e()):this.run(t,e)})}}},function(t,e){t.exports=class{constructor(t,e){this.hanoigame=t,this.$el=e,this.setupTowers(),this.render(),this.$el.on("click","ul",this.clickTower.bind(this))}setupTowers(){for(let t=0;t<3;t++){const e=$("<ul>").data("tower",t);this.$el.append(e)}const t=$("ul:first-of-type");for(let e=0;e<3;e++)t.append($("<li>").addClass(`disc-${e+1}`))}render(){this.hanoigame.towers.forEach((t,e)=>{const n=$(".hanoi").find("ul")[e],o=$(n);o.children().remove(),t.slice().reverse().forEach(t=>{const e=$("<li>").addClass(`disc-${t}`);o.append($(e))})})}clickTower(t){if(void 0!==this.initialTower){const e=$(t.currentTarget).data("tower");this.hanoigame.move(this.initialTower,e)||alert("Invalid move. Try again."),this.initialTower=void 0,this.render(),this.$el.find("ul").removeClass("clicked")}else this.initialTower=$(t.currentTarget).data("tower"),$(t.currentTarget).addClass("clicked");if(this.hanoigame.isWon()){const t=$("<h2>").text("You won!!");$("body").append(t),this.$el.off("click")}}}}]);