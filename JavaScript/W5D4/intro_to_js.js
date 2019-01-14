function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

// mysteryScoping5();

function madLib(verb, adjective, noun) {
  console.log(`We shall ${verb} the ${adjective} ${noun}`);
}

// madLib("make", "best", "guac");

function isSubstring(searchString, subString) {
  console.log(searchString.indexOf(subString) !== -1);
}

// isSubstring("time to program", "time");
// isSubstring("Jump for joy", "joys");

function fizzBuzz(array) {
  const new_arr = [];

  for(let i = 0; i < array.length; i++) {
    num = array[i];
    if (num % 3 == 0 && num % 5 != 0) {
      new_arr.push(num);
    } else if (num % 3 != 0 && num % 5 == 0) {
      new_arr.push(num);
    }
  }

  return new_arr;
}

// console.log(fizzBuzz([3,6,15,30,5,10,4,7,36]));

function isPrime(num) {
  if (num <= 1) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i == 0) {
      return false;
    }
  }

  return true;
}

// console.log(isPrime(2));
// console.log(isPrime(10));
// console.log(isPrime(15485863));
// console.log(isPrime(3548563));

function sumOfNPrimes(num) {
  let primes = [];
  let sum = 0;

  for (let i = 0; primes.length < num; i++) {
    if (isPrime(i)) {
      primes.push(i);
      sum += i;
    }
  }

  return sum;
}

// console.log(sumOfNPrimes(0));
// console.log(sumOfNPrimes(1));
// console.log(sumOfNPrimes(4));

function titleize(arr, cb) {
  new_arr = arr.map(el => `Mx. ${el} Jingleheimer Schmidt`);
  cb(new_arr);
}

// titleize(["Mary", "Brian", "Leo"], (arr) => {
//   arr.forEach((el) => console.log(el));
// });

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes phrRRRRRRR!!!!!!!`);
};

Elephant.prototype.grow = function() {
  this.height += 12;
  console.log(`${this.height}`);
};

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
  console.log(`${this.tricks}`);
};

Elephant.prototype.play = function() {
  idx = Math.floor(Math.random() * this.tricks.length);
  console.log(`${this.name} is ${this.tricks[idx]}`);
};

Elephant.paradeHelper = function (elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

// geoff = new Elephant("Geoff", 600, ["painting a picture"]);
// geoff.trumpet();
// geoff.grow();
// geoff.addTrick("running")
// geoff.play();

let ellie = new Elephant("Ellie", 185, [
  "giving human friends a ride",
  "playing hide and seek"
]);
let charlie = new Elephant("Charlie", 200, [
  "painting pictures",
  "spraying water for a slip and slide"
]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, [
  "trotting",
  "playing tic tac toe",
  "doing elephant ballet"
]);

let herd = [ellie, charlie, kate, micah];
// herd.forEach(Elephant.paradeHelper);


function dinerBreakfast() {
  order = ["cheesy scrambled eggs"];
  console.log(`I'd like ${order.join(" and ")} please`);
  
  return function(food_item) {
    order.push(food_item);
    console.log(`I'd like ${order.join(" and ")} please`);
  };
}

let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");