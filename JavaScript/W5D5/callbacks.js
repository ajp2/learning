// window.setTimeout(() => alert("HAMMERTIME"), 5000);

// function hammerTime(time) {
//   window.setTimeout(() => alert(`${time} is hammertime!`), time);
// }

// const readline = require('readline');

// const reader = readline.createInterface({
//   input: process.stdin,
//   output: process.stdout
// })

// reader.question("Would you like some tea?", (res) => {
//   console.log(`${res}`);
//   reader.question("Would you like some biscuits?", (res2) => {
//     console.log(`So you ${res} want tea and you ${res2} want coffee`);;
//     reader.close();
//   });
// });


function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`)
};

const Markov = new Cat();
const Noodles = new Dog();

// Noodles.chase(Markov);
Noodles.chase.apply(Markov, [Noodles]);