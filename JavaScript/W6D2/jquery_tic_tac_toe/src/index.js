const View = require('./ttt-view');
const Game = require('./game');

  $(() => {
    const $container = $('.ttt');
    const game = new Game();
    const view = new View(game, $container);
  });
