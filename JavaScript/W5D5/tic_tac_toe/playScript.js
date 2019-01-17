const Game = require('./game');
const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const completionCallback = function () {
  reader.question("Would you like to play again?", (res) => {
    if (res === "yes") {
      let g = new Game(reader, completionCallback);
      g.run();
    } else {
      reader.close();
    }
  })
}

let g = new Game(reader);
g.run(reader, completionCallback);