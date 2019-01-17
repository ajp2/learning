class Game {
  constructor(reader, completionCallback) {
    this.towers = [[3, 2, 1], [], []];
    this.reader = reader;
    this.completionCallback = completionCallback;
  }

  run() {
    this.promptMove((startTowerIdx, endTowerIdx) => {
      if (!this.move(startTowerIdx, endTowerIdx)) {
        console.log("Error, invalid towers. Try again.");
      } else {
        this.print();
      }

      if (!this.isWon()) {
        this.run();
      } else {
        console.log("Congratulations! You won!");
        this.completionCallback();
      }
    });
  }

  promptMove(cb) {
    console.log(this.towers);
    this.reader.question("Which tower would you like to move from?", (startTowerIdx) => {
      this.reader.question("Which tower would you like to move the disc to?", (endTowerIdx) => {
        startTowerIdx = parseInt(startTowerIdx);
        endTowerIdx = parseInt(endTowerIdx);
        cb(startTowerIdx, endTowerIdx);
      });
    });
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if ((startTowerIdx < 0 || startTowerIdx > 2) || (endTowerIdx < 0 || endTowerIdx > 2)) {
      return false;
    }

    const startDisc = this.towers[startTowerIdx].slice().pop();
    const endDisc = this.towers[endTowerIdx].slice().pop();

    if (!endDisc) {
      return !!startDisc;
    } else {
      return startDisc < endDisc;
    }
  }

  move(startTowerIdx, endTowerIdx) {
    if (!this.isValidMove(startTowerIdx, endTowerIdx)) {
      return false;
    }

    const startDisc = this.towers[startTowerIdx].pop();
    this.towers[endTowerIdx].push(startDisc);
    return true;
  }

  print() {
    console.log(JSON.stringify(this.towers));
  }

  isWon() {
    const totalDiscs = this.towers.reduce((acc, val) => acc += val.length, 0);
    return this.towers[0].length === 0 && 
      (this.towers[1].length === totalDiscs || 
        this.towers[2].length === totalDiscs);
  }
}

module.exports = Game;